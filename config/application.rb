require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Opifices
  class Application < Rails::Application
    config.time_zone = 'Beijing'
    config.i18n.default_locale = 'zh-CN'
    I18n.enforce_available_locales = false
    # 关闭用不到的middleware以优化性能
    %w(
      ActionDispatch::RequestId
      Rack::ConditionalGet
      Rack::ETag
      Rack::Sendfile
      ).each { |middleware| config.middleware.delete middleware }
    config.autoload_paths += %W["#{config.root}/app/validators/"] # 自定义validator
    config.autoload_paths += %W["#{config.root}/lib/"] # 自定义库文件
  end
end
CFG = YAML.load_file("#{Rails.root}/config/project.yml")[Rails.env] # 加载项目配置文件
SITE_NAME = CFG['sitename']
