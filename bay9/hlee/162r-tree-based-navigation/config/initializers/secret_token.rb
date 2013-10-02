# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Cms::Application.config.secret_key_base = 'ce313d9ed1ec4679fd54cddf67ade6cddafa350d27ff040bf6bcd617c6a054cc37ad7b0c38d45eb99cd3c78160dbf504d11d2319569131dfdd2f940ffb8bdea2'
