module Sinatra
  module Decorator
    VERSION = '0.1.1' unless defined?(Sinatra::Decorator::VERSION)

    def self.version
      VERSION
    end
  end
end
