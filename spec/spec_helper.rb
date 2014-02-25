require 'json'
require 'kitpay'
require 'webmock/rspec'

RSpec.configure do |config|

  config.before(:each) do
    shop_url = 'http://test-store.myponty.com'
    access_token = 'b68da7c5eb6c07ff3f5a1ce731555fdc'

    Kitpay.setup(url: shop_url, access_token: access_token)
  end

  def load_json(name)
    File.read(File.dirname(__FILE__) + "/json/#{name}.json")
  end

  def fake_web(endpoint, options={})
    file = options[:json_file] || endpoint
    request_body = options.delete(:request_body)
    body = options.has_key?(:body) ? options.delete(:body) : load_json(file)
    method = options.delete(:method) || :get

    url = "#{Kitpay.url}/api/#{endpoint}.json"
    params = {body: request_body}
    params.merge! query: options[:query] if options[:query]
    stub_request(method, url).with(params).to_return(body: body, headers: { content_type: 'text/json' })
  end

end
