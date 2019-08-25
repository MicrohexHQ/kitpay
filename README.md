# Kitpay
![](https://github.com/MicrohexHQ/kitpay/blob/master/U/AI/ArtBoard%20Image%20(639).jpg)

PayPonty Ruby API

[![Gem Version](https://badge.fury.io/rb/kitpay.png)](http://badge.fury.io/rb/kitpay)

## Install

$ gem install kitpay

## Use

Use api clients example:

    require 'kitpay'
    Kitpay.setup url: 'http://your-shop-name.myponty.com', login: 'api_key', password: 'password'
    #next step
    Kitpay.orders # to see yours orders

Use OAuth2 example:

    require 'kitpay'
    Kitpay.setup url: 'http://your-best-domain.com', access_token: 'access token'
    #next step
    Kitpay.products # to see yours products



