module Sinatra
  module Decorator
    ##
    # Registers helpers into your application
    #
    # @param [Sinatra::Application] app
    #   The specified sinatra application
    #
    # @example Register the helper module
    #   require 'sinatra-decorator'
    #   class Sinatra::Application
    #     register Sinatra::Decorator::Helpers
    #   end
    #
    module Helpers
      class << self
        def registered(app)
          app.helpers Sinatra::Decorator::DecorateHelpers
          app.load_paths << File.join(app.settings.root, 'decorators')
          decorators_path = File.join(app.settings.root, 'decorators/**/*.rb')
          Sinatra.dependency_paths << decorators_path
          Sinatra.require_dependencies(decorators_path)
        end
        alias :included :registered
      end
    end # Helpers

  end # Decorator
end # Sinatra
