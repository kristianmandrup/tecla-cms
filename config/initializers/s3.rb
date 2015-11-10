# [FIXME]: Make it configurable for `cms-models` gem
if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'aws',
      :aws_access_key_id      => ENV['AWS_KEY'] || 'FAKEKEY',
      :aws_secret_access_key  => ENV['AWS_SECRET'] || 'FAKESECRET',
      :region                 => ENV['AWS_REGION'] || 'eu-central-1'# Change this for different AWS region. Default is 'us-east-1'
    }
    config.fog_directory  = ENV['AWS_BUCKET'] || 'tecla-cms-fake'
  end
end
