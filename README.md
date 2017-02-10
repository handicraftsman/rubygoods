# Rubygoods

Some utils for Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubygoods'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubygoods

## Usage

This library includes:

1. Some kind of logger
2. Shortcut for gem-version getter
3. Multi-Class Proxy
4. `RG::Utils.notnil` method which returns `false` if ANY argument is `nil` and true in all other cases
5. Some anti-code-inject utils

## Proxy

Syntax for proxies is simple:

```ruby
p = RG::Proxy.new :multiple, [[1,2,3],[4,5,6]] # :multiple mode takes array of objects with same class
p.sum # => [6, 15] # All unknown methods are redirected to stored objects

# Instance Evals and Inspects
p.p_eval "self.sum" # => [6, 15] # Proxy#p_eval calls `instance_eval` method for each object
p.p_inspect # => ["[1,2,3]","[4,5,6]"] # You see
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

