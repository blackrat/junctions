# Junctions
Layered junctioning for Rails. Feature flags done right.

Junctions works by enabling conditional namespaced module inclusion. What that actually means is that features
in a module can be enabled or disable by creating them in a particular namespace. For example:

```ruby
module Core
  include Junctions
  def overridden_method
    puts('You are in core')
  end
end

module Wibble
  def overridden_method
    puts('Wibble')
  end
end

module Wobble
  def overridden_method
    puts('Something else')
  end
end
```
Including Junctions in Core means that if there is a 'junctions' setting as, for example, an environment variable
```bash
  junctions=wibble, wobble
```
would first load up Core, then Wibble and finally Wobble as modules and include each of them in turn. This has the effect of
overriding the 'overridden_method' inside Core to display 'Something else' as the message.
Likewise if the environment variable were:
```bash
  junctions=wibble
```
This would only include Wibble into the list of namespaces to override Core methods.

Ruby and Rails Versions

Junctions has been built for Ruby 2.5 and Rails 5. Although it was originally built for Ruby 1.8 and Rails 2, 
because of fundamental changes to later versions of rails and engines in particular, the decision was made to
track the latest Rails version only.






