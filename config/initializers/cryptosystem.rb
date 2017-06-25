# config/initializers/cryptosystem.rb

Cryptosystem::RSA.configure do |config|
  config.password = ENV['secret-password']
  config.private_key_path = ENV['private_key_path']
  config.public_key_path = ENV['public_key_path']
end