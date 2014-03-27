module Sinatra
  module Decorator
    module Decoratable
      def decorate(options = {})

        klass = options[:as]
        klass_name = "#{self.class}Decorator"
        klass = klass_name.constantize if klass.nil?
        decorator = klass.new(self, context: self)

        yield decorator if block_given?
        decorator
      end
    end # Decoratable
  end # Decorator
end # Sinatra

