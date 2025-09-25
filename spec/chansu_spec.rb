# frozen_string_literal: true

# spec/chansu_spec.rb
require 'chansu'

RSpec.describe Chansu do # rubocop:disable Metrics/BlockLength
  describe '.chance' do
    it 'accepts percentage strings' do
      100.times do
        expect([true, false]).to include(Chansu.chance('50%'))
      end
    end

    it 'accepts decimal floats' do
      100.times do
        expect([true, false]).to include(Chansu.chance(0.5))
      end
    end

    it 'accepts integers as percents' do
      100.times do
        expect([true, false]).to include(Chansu.chance(25))
      end
    end
  end

  describe '.dice' do
    it 'rolls a single die' do
      50.times do
        expect(Chansu.dice(6)).to be_between(1, 6)
      end
    end

    it 'rolls multiple dice' do
      rolls = Chansu.dice(6, 3)
      expect(rolls.size).to eq(3)
      expect(rolls).to all(be_between(1, 6))
    end
  end

  describe '.roll (alias of .dice)' do
    it 'parses dice expressions' do
      result = Chansu.roll('2d6+3')
      expect(result[:rolls].size).to eq(2)
      expect(result[:total]).to be >= 5
    end
  end
end
