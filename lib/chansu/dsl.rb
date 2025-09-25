# frozen_string_literal: true

# DSL for the table of common probability words.
# If you are cronically online you will get this
module Chansu
  def always
    chance(1.0) { yield if block_given? }
  end

  def certainly
    chance(0.9) { yield if block_given? }
  end

  def almost_always
    chance(0.85) { yield if block_given? }
  end

  def usually
    chance(0.8) { yield if block_given? }
  end

  def often
    chance(0.75) { yield if block_given? }
  end

  def likely
    chance(0.7) { yield if block_given? }
  end

  def frequently
    chance(0.65) { yield if block_given? }
  end

  def probably
    chance(0.6) { yield if block_given? }
  end

  def more_often_than_not
    chance(0.6) { yield if block_given? }
  end

  def maybe
    chance(0.5) { yield if block_given? }
  end

  def possibly
    chance(0.4) { yield if block_given? }
  end

  def not_often
    chance(0.35) { yield if block_given? }
  end

  def unlikely
    chance(0.25) { yield if block_given? }
  end

  def with_low_probability
    chance(0.15) { yield if block_given? }
  end

  def rarely
    chance(0.1) { yield if block_given? }
  end
end
