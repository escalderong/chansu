# frozen_string_literal: true

require_relative 'chansu/version'
require_relative 'chansu/dsl'
require_relative 'chansu/loops'
require_relative 'chansu/toss'

# DSL for chance, probability, randomness
module Chansu
  @globals_enabled = false

  @dsl_methods = %i[chance
                    always
                    certainly
                    almost_always
                    usually
                    often
                    likely
                    frequently
                    probably
                    more_often_than_not
                    maybe
                    possibly
                    not_often
                    unlikely
                    with_low_probability
                    rarely
                    never
                    until_success
                    until_failure]

  @dice_methods = %i[coin
                     dice
                     roll]

  def self.enable_globals! # rubocop:disable Metrics/MethodLength
    return if @globals_enabled

    (@dsl_methods + @dice_methods).each do |method|
      Kernel.define_method(method) do |*args, &block|
        Chansu.send(method, *args, &block)
      end
    end

    [4, 6, 8, 10, 12, 20, 100].each do |sides|
      Kernel.define_method("d#{sides}") do |times = 1|
        Chansu.dice(sides, times)
      end
    end

    @globals_enabled = true
  end

  def self.disable_globals!
    return unless @globals_enabled

    (@dsl_methods + @dice_methods).each do |method|
      Kernel.send(:remove_method, method) if Kernel.method_defined?(method)
    end

    [4, 6, 8, 10, 12, 20, 100].each do |sides|
      Kernel.send(:remove_method, "d#{sides}".to_sym) if Kernel.method_defined?("d#{sides}".to_sym)
    end

    @globals_enabled = false
  end

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

Chansu.enable_globals!

module Kernel
  include Chansu
end
