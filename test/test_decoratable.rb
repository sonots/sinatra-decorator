require File.expand_path("#{File.dirname(__FILE__)}/helpers/helper")

describe Sinatra::Decorator::Decoratable do

  class User
    include Sinatra::Decorator::Decoratable
    attr_accessor :username, :full_name
    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value) rescue nil
      end
    end
  end

  class UserDecorator < Sinatra::Decorator::Base
    def name
      object.full_name.present? ? object.full_name : object.username
    end
  end

  describe '.decorate' do
    let(:dorothy) { User.new(username: 'Dorothy', full_name: 'Dorothy Gale') }
    let(:toto)    { User.new(username: 'Toto') }

    it 'Possible to decorate the single object' do
      assert_equal dorothy.decorate.name, dorothy.full_name
    end
  end

end

