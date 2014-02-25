require 'spec_helper'

describe Kitpay::Client::Shop do

  before do
    fake_web "shop"
  end

  it 'should get current shop' do
    Kitpay.shop['domain'].should_not be_empty
  end
  
end
