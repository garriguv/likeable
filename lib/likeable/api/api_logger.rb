module Likeable
  module Api
    class ApiLogger
      def initialize(app)
        @app = app
      end

      def call(request_env)
        @app.call(request_env).on_complete do |response_env|
          puts "#{request_env[:method].upcase} #{request_env[:url]} #{response_env[:status]}"
        end
      end
    end
  end
end
