# frozen_string_literal: true

# Block runner with probability stops
module Chansu
  def self.until_success(chance: 0.5, max_attempts: 10)
    raise ArgumentError, 'max_attempts must be greater than 0' unless max_attempts.positive?
    raise ArgumentError, 'chance must be between 0.0 and 1.0' unless chance.between?(0.0, 1.0)
    raise ArgumentError, 'A block must be provided' unless block_given?

    attempts = 0
    until chance(chance)
      attempts += 1
      yield attempts
      break if attempts >= max_attempts
    end
    attempts
  end

  def self.until_failure(chance: 0.5, max_attempts: 10)
    raise ArgumentError, 'max_attempts must be greater than 0' unless max_attempts.positive?
    raise ArgumentError, 'chance must be between 0.0 and 1.0' unless chance.between?(0.0, 1.0)
    raise ArgumentError, 'A block must be provided' unless block_given?

    attempts = 0
    while chance(chance)
      attempts += 1
      yield attempts
      break if attempts >= max_attempts
    end
    attempts
  end
end
