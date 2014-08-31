require File.expand_path("#{File.dirname(__FILE__)}/helpers/helper")

describe Sinatra::Decorator::Base do
  let(:decorator_class) { Class.new(Sinatra::Decorator::Base) }
  let(:model)           { Object.new }

  describe "#to_model" do
    subject { decorator_class.new(model) }
    it { subject.to_model.must_equal model }
  end
end
