class PostDecorator < Sinatra::Decorator::Base
  def formated_body
    object.body.gsub('b', 'a')
  end
end
