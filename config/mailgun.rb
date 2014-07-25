# Initialize your Mailgun object:
Mailgun.configure do |config|
  config.api_key = 'key-6adc5d9657c4a4cf537515df420fc05b'
  config.domain  = 'your-mailgun-domain'
end

@mailgun = Mailgun()

# or alternatively:
@mailgun = Mailgun(:api_key => 'pubkey-192e6b36b1cedd6bf5f4b7845aaf7b9a')