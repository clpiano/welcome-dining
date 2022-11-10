require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WelcomeDining
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    #日本語化
    config.i18n.default_locale = :ja

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    #データベースのデータを日本の現在時刻にする設定
    config.time_zone = "Asia/Tokyo"
    # config.eager_load_paths << Rails.root.join("extras")
    config.active_record.default_timezone = :local
  end
end
