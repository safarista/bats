CarrierWave.configure do |config|

    config.fog_credentials     = {
        :provider              => 'AWS',
        :aws_access_key_id     => 'AKIAJDCQ7GM3NVVL3ILA',
        :aws_secret_access_key => '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',
        :region                => 'eu-west-1'
    }


    # config.storage        = :s3
    config.fog_directory  = 'bats' # required
    # config.fog_host     = 'https://media.daniloveday.co.uk' # Optional, defaults to nil
    config.fog_public     = true # Optional, defaults to true
    config.permissions    = 0666
    config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' } # Optional, defaults to {}

end