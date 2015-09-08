CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'aws',
      :aws_access_key_id      => 'AKIAI32FKR4KSD2NJRUA',
      :aws_secret_access_key  => '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',
      :region                 => 'eu-central-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = 'tecla-cms'

end