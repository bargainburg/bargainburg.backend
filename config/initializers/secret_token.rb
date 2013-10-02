# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4 
# requires secret_key_base or secret_toke to be defined, otherwise an 
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.
Api::Application.config.secret_token = '6abb6cc32c346a89f93e19c89e43600489fabcca7a62f3ca444eaf5b1657d71ca62379a6794a93b95f07160a690c272bbe834743a3e14de56845a0fe2bf0b5f7'
Api::Application.config.session_store :cookie_store, :key => '_bargainsburg_api'
