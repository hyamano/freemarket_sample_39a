require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|


  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  elsif Rails.env.production?
    config.fog_credentials = {
      config.storage = :fog
      config.fog_provider = 'fog/aws'
      provider: 'AWS',
      aws_access_key_id: Rails.application.secrets.aws_access_key_id,
      aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'mercari999'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercari999'
  end

end