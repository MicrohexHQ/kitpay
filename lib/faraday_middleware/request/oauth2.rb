require 'faraday'
require 'forwardable'

module FaradayMiddleware

  class OAuth2 < Faraday::Middleware 

    AUTH_HEADER = 'Authorization'.freeze

    extend Forwardable

    def call(env)
      if !@token.empty?
        env[:request_headers][AUTH_HEADER] ||= "Bearer #{@token}"
      end

      @app.call env
    end

    def initialize(app, token = nil, options = {})
      super(app)
      options, token = token, nil if token.is_a? Hash
      @token = token && token.to_s
    end

  end
end

# deprecated alias
Faraday::Request::OAuth2 = FaradayMiddleware::OAuth2
