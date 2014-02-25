require 'kitpay/configuration'
require 'kitpay/client'

module Kitpay
  extend Configuration

  class << self

    # @return [Kitpay::Client]
    def new(options={})
      options['url'] = self.url
      options['access_token'] = self.access_token
      options['login'] = self.login
      options['password'] = self.password
      Kitpay::Client.new(options)
    end


    # Delegate to Kitpay::Client.new
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def setup(options)
      self.url = options[:url]
      self.url = "http://#{self.url}" unless self.url.start_with?('http://', 'https://')
      self.access_token = options[:access_token]
      self.login = options[:login] # or basic auth
      self.password = options[:password]
      options
    end

  end

end

Faraday.register_middleware :request, :oauth2   => lambda { FaradayMiddleware::OAuth2 }
