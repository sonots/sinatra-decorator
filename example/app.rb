# my_app.rb
require 'sinatra'
require 'slim'
require 'sinatra-decorator'
require_relative 'models/post'
require_relative 'decorators/post_decorator'

get '/' do
  @post = Post.new.decorate
  slim :show
end
