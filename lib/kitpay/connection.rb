# encoding: utf-8
require 'faraday_middleware'
require 'faraday_middleware/request/oauth2'

module Kitpay

  module Connection
    private

    def connection
      @conn ||= Faraday.new(:url => url) do |builder|
        builder.request :oauth2, access_token if access_token
        builder.request :basic_auth, login, password if login and password
        builder.request :json

        builder.response :json, :content_type => /\bjson$/

        builder.adapter :net_http
      end
      @conn
    end

  end
end
