# Sinatra Decorator

sinatra-decorator is a gem for [Sinatra](http://www.sinatrarb.com/).  
Adds an object-oriented layer of presentation logic to your Sinatra application.

[![Build Status](https://travis-ci.org/sonots/sinatra-decorator.svg)](https://travis-ci.org/sonots/sinatra-decorator)
[![Code Climate](https://codeclimate.com/github/sonots/sinatra-decorator.png)](https://codeclimate.com/github/sonots/sinatra-decorator)
[![Coverage Status](https://coveralls.io/repos/sonots/sinatra-decorator/badge.png)](https://coveralls.io/r/sonots/sinatra-decorator)
[![Dependency Status](https://gemnasium.com/sonots/sinatra-decorator.png)](https://gemnasium.com/sonots/sinatra-decorator)

## Installation

Add the following to your `Gemfile`:

```ruby
gem 'sinatra/decorator'
```

And then execute:

```plain
$ bundle
```

## Examples

```ruby
# app.rb
require 'sinatra'
require 'slim'
require 'sinatra/decorator'
require_relative 'models/post'
require_relative 'decorators/post_decorator'

get '/' do
  @post = Post.new.decorate # will try to find "#{self.class}Decorator" class
  slim :show
end

# models/post.rb
#class Post < ActiveRecord::Base
#  include Sinatra::Decorator::Decoratable
#end
class Post
  include Sinatra::Decorator::Decoratable

  attr_accessor :id, :body
  def initialize(params = {})
    @id   = params[:id]   || 1
    @body = params[:body] || "body"
  end
end

# decorators/post_decorator.rb
class PostDecorator < Sinatra::Decorator::Base
  def formated_body
    object.body.gsub('b', 'a')
  end
end

# views/show.slim
h1 = @post.id
div
  = @post.formated_body
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

* Copyright (c) 2013 Takeshi Yabe (the author of [padrino-decorator](https://github.com/tyabe/padrino-decorator)).
* Copyright (c) 2014 Naotoshi Seo. See [LICENSE](LICENSE) for details.

## Special Thanks

This gem was made on the basis of the [padrino-decorator](https://github.com/tyabe/padrino-decorator). 
I greatly appreciate for the orignal author Mr. [@tyabe](https://github.com/tyabe).
