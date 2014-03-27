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
gem 'sinatra-decorator'
```

And then execute:

```plain
$ bundle
```

## Examples

```ruby
# app/controllers/posts.rb
SampleProject::App.controllers :posts do

  get :index do
    source = Post.all
    @posts = decorate(source)
    render 'posts/index'
  end

  get :show, with: :id do
    source = Post.find(params[:id])
    @post = decorate(source)
    # or
    @post = PostDecorator.new(source, context: self)
    render 'posts/show'
  end

end

# app/decorators/post_decorator.rb
class PostDecorator < Sinatra::Decorator::Base
  context SampleProject::App

  def formated_body
    h.simple_format(object.body)
  end

end

# app/views/posts/show.slim
h1 = @post.title
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

Copyright (c) 2014 Naotoshi Seo. See [LICENSE](LICENSE) for details.
