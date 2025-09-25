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
  gem 'chansu'
```
Then execute
  ```bash
  bundle install
```
Or just do
  ```bash
  gem install chansu
```
---

## 🛠️ Usage
### Probability DSL
```ruby
require "chansu"

probably { puts "Hello, world!" }   # ~60% chance
rarely   { puts "Surprise!" }       # ~10% chance
always   { puts "Guaranteed!" }     # 100%
```

### DSL Reference Table
| Method                 | Probability | Example                                       |
|-------------------------|-------------|-----------------------------------------------|
| `always`               | 100%        | `always { puts "Guaranteed!" }`               |
| `certainly`            | 90%         | `certainly { puts "Very likely" }`            |
| `almost_always`        | 85%         | `almost_always { puts "Pretty often" }`       |
| `usually`              | 80%         | `usually { puts "Most of the time" }`         |
| `often`                | 75%         | `often { puts "Happens often" }`              |
| `likely`               | 70%         | `likely { puts "Quite probable" }`            |
| `frequently`           | 65%         | `frequently { puts "Fairly frequent" }`       |
| `probably`             | 60%         | `probably { puts "More often than not" }`     |
| `more_often_than_not`  | 60%         | `more_often_than_not { puts "Similar to probably" }` |
| `maybe`                | 50%         | `maybe { puts "Flip a coin" }`                |
| `possibly`             | 40%         | `possibly { puts "Could happen" }`            |
| `not_often`            | 35%         | `not_often { puts "Less common" }`            |
| `unlikely`             | 25%         | `unlikely { puts "Not very likely" }`         |
| `with_low_probability` | 15%         | `with_low_probability { puts "Long shot" }`   |
| `rarely`               | 10%         | `rarely { puts "Almost never" }`              |
| `never`                | ~0%  😉       | `never { puts "Basically never" }`            |


### Dice Rolls
```ruby
require "chansu"

dice            # 2
dice(42)        # 31
dice(15, 3)     # [15, 9, 15]
d6              # 6
d20             # 11
d100            # 90
dice("2d10")    # {:rolls=>[9, 5], :total=>14}
dice("3d8+5")   # {:rolls=>[3, 3, 4], :total=>15}
```
---
## ⚙️ Config 
### Controlling globals
By default, all DSL methods are available globally
If you want to remove them from your global namespace, disable them with:
```ruby
Chansu.disable_globals!
```
And include them in your own modules/classes:
```ruby
class MyClass
  include Chansu
end
```
---
## 📦 Development
Clone and install dependencies:
```bash
bundle install
```
Run tests
```bash
rake test
```
Build gem
```
gem build
```
---
## 🤝 Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/escalderong/chansu
Feel free to suggest new probability words, dice, or randomness helpers!

---
## 📜 License
The gem is available as open source under the terms of the MIT License.