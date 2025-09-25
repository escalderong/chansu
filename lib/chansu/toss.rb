# frozen_string_literal: true

# For everything that is throwed in the air expecting a result
module Chansu
  def self.coin
    chance(0.5) ? :heads : :tails
  end

  def self.dice(sides = 6, times = 1) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    case sides
    when String
      expr = sides
      match = expr.match(/(\d+)d(\d+)([+-]\d+)?/)
      raise ArgumentError, "Invalid dice expression: #{expr}" unless match

      times, sides, modifier = match.captures
      rolls = Array.new(times.to_i) { rand(1..sides.to_i) }
      total = rolls.sum + (modifier ? modifier.to_i : 0)

      { rolls: rolls, total: total }

    when Integer
      raise ArgumentError, 'Die must have at least 1 side' if sides < 1

      if times == 1
        rand(1..sides)
      else
        Array.new(times) { rand(1..sides) }
      end

    else
      raise ArgumentError, "Unsupported dice argument: #{sides.inspect}"
    end
  end

  class << self
    alias roll dice
  end
end
