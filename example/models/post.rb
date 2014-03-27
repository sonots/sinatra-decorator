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
