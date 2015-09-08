CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'aws',
      :aws_access_key_id      => ENV['AWS_KEY'],
      :aws_secret_access_key  => ENV['AWS_SECRET'],
      :region                 => ENV['AWS_REGION'] # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = ENV['AWS_BUCKET']

end