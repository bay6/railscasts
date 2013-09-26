# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Cms::Application.config.secret_key_base = '8df09c6cc3878773abd32e39169e29f56fcedd8d20221d2bc0594a587705c3226ba0a3fce94f0c390d399c8a953397b36d20911f5c722e5f1dfb7432283046d9'
