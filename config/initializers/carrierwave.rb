CarrierWave.configure do |config|
  config.storage = :qiniu
  config.qiniu_access_key    = CFG['qiniu']['access']
  config.qiniu_secret_key    = CFG['qiniu']['secret']
  config.qiniu_bucket        = CFG['qiniu']['bucket']
  config.qiniu_bucket_domain = CFG['qiniu']['domain']
  config.qiniu_protocol      = 'https'
end