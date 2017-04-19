OmniAuth pixiv
==============

pixiv OAuth2 Strategy for OmniAuth.


Installation
------------

Add this line to your application's Gemfile:

    gem "omniauth-pixiv-public"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-pixiv-public

Usage
-----

Here's an example for adding the middleware to a Rails app in
`config/initializers/omniauth.rb`:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :pixiv,
        ENV["PIXIV_OAUTH_KEY"],
        ENV["PIXIV_OAUTH_SECRET"],
        :scope => ENV["PIXIV_OAUTH_SCOPE"]
    end
