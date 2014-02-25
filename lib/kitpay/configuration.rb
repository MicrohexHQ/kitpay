require 'faraday'
require 'kitpay/version'

module Kitpay
  module Configuration
    VALID_OPTIONS_KEYS = [
      :adapter,
      :api_version,
      :url,
      :access_token,
      :login,
      :password,
      :user_agent,
      :auto_traversal,
      :per_page].freeze

    DEFAULT_ADAPTER        = Faraday.default_adapter
    DEFAULT_API_VERSION    = 1
    DEFAULT_USER_AGENT     = "Kitpay Ruby Gem #{Kitpay::VERSION}".freeze
    DEFAULT_AUTO_TRAVERSAL = false
    DEFAULT_PER_PAGE       = 30

    attr_accessor(*VALID_OPTIONS_KEYS)

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end

    def reset
      self.adapter        = DEFAULT_ADAPTER
      self.api_version    = DEFAULT_API_VERSION
      self.access_token   = nil
      self.login          = nil
      self.password       = nil
      self.user_agent     = DEFAULT_USER_AGENT
      self.auto_traversal = DEFAULT_AUTO_TRAVERSAL
      self.per_page       = DEFAULT_PER_PAGE
    end
  end
end
