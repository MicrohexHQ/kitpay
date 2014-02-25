require 'spec_helper'

describe Kitpay::Client::Products do

  before do
    fake_web "products", query: {per_page: 30, page: 1}
  end

  it 'should get products' do
    Kitpay.products.size.should_not eql 0
  end

  it 'should get product' do
    id = 138
    fake_web "products/#{id}", json_file: :product
    Kitpay.product(id)['id'].should eql id
  end
  
end
