require 'kitpay/connection'
require 'kitpay/request'
require 'kitpay/traversal'

#Load all files in client/ directory
Dir.glob("#{File.expand_path(File.dirname(__FILE__))}/client/*.rb").sort.each do |f|
  require f.match(/(kitpay\/client\/.*)\.rb$/)[0]
end

module Kitpay
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options={})
      options = Kitpay.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Kitpay::Connection
    include Kitpay::Request
    include Kitpay::Traversal
  end
end
