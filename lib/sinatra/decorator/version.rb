module Sinatra
  module Decorator
    VERSION = '0.2.0' unless defined?(Sinatra::Decorator::VERSION)

    def self.version
      VERSION
    end
  end
end
