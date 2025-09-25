# Chansu 🎲  
*A Ruby gem for probability-driven DSLs and dice rolls.*  

**チャンス** gives you cool ways to write code with probabilities, dice rolls, and randomness.  
It comes with a natural-language DSL for describing likelihoods (`probably`, `rarely`, `always`, etc.) and utility methods like dice rolls (`d6`, `d20`, …).  

---

## ✨ Features
- 🎲 **Dice rolls**: `d6`, `d20`, `d100` and even ([dice notation](https://en.wikipedia.org/wiki/Dice_notation)).  
- 📊 **Probability DSL**: Write code like:  
  ```ruby
  probably { puts "this happens ~60% of the time" }
  rarely   { puts "this almost never happens" }
  always   { puts "this always happens" }

- 🌍 **Globally available** by default – no need to include anything. - (Can be disabled with Chansu.disable_globals!)
- 🕹️ Useful for games, simulations, generative art, or just spicing up your Ruby scripts.

---

## 🚀 Installation

Add this line to your application's Gemfile:
  ```ruby
  gem "chansu"

Then execute
  ```bash
  bundle install

Or just do
  ```bash
  gem install chansu

---

## 🛠️ Usage