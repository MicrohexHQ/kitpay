require 'spec_helper'

describe Kitpay::Client::Orders do

  it 'should get orders' do
    fake_web "orders", query: {per_page: 30, page: 1}
    Kitpay.orders.size.should_not eql 0
  end

  it 'should get order' do
    id = 99
    fake_web "orders/#{id}", json_file: :order
    Kitpay.order(id)['id'].should eql id
  end
  
end
