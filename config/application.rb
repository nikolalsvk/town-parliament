require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemdile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

Elasticsearch::Model.client = Elasticsearch::Client.new host: ENV['SEARCHBOX_URL']

module TownParliament
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.enforce_available_locales = true

    config.active_record.raise_in_transactional_callbacks = true

    # Enable the asset pipeline
    config.assets.enabled = true

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Heroku required setting
    config.assets.initialize_on_precompile = false

    config.autoload_paths << Rails.root.join('lib')
  end
end
