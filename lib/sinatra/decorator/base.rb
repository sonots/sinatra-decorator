require 'delegate'
module Sinatra
  module Decorator
    class Base < SimpleDelegator

      attr_reader :object

      def initialize(object, options = {})
        @object = object
        @context = options[:context]
        super(object)
      end

      def to_model
        __getobj__
      end

      def decorated?
        true
      end

      private

      def self.context(context)
        _helper_method_name = :h
        define_method(_helper_method_name) do
          @context || context.to_s.camelize.constantize.new!
        end
        private _helper_method_name
      end

    end # Base

  end # Decorator
end # Sinatra
