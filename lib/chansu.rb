# frozen_string_literal: true

require_relative "chansu/version"
require_relative "chansu/dsl"
require_relative "chansu/loops"
require_relative "chansu/toss"

# DSL for chance, probability, randomness
module Chansu
  class Error < StandardError; end

  def self.chance(prob = 0.5) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
    probability =
      case prob
      when String
        raise ArgumentError, 'Invalid string format for probability' unless prob.end_with?('%')

        prob.to_f / 100.0

      when Integer
        raise ArgumentError, 'Integer probability must be between 0 and 100' unless prob.between?(0, 100)

        prob.to_f / 100.0

      when Float
        raise ArgumentError, 'Float probability must be between 0.0 and 1.0' unless prob.between?(0.0, 1.0)

        prob

      end

    passed = rand < probability

    yield if passed && block_given?

    passed
  end
end

module Kernel
  include Chansu
end
