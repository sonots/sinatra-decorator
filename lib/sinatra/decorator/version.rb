module Sinatra
  module Decorator
    VERSION = '0.0.2' unless defined?(Sinatra::Decorator::VERSION)

    def self.version
      VERSION
    end
  end
end
