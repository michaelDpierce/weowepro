require File.expand_path('../boot', __FILE__)
# Pick the frameworks you want:
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

SESSIONS = proc { |controller| user_signed_in? ? 'application' : 'devise' }
REGISTRATION = proc { |controller| user_signed_in? ? 'application' : 'devise' }

module Weowe
  class Application < Rails::Application
    system("rubocop -D #{Rails.root}") if Rails.env.development?

    config.generators do |g|
      g.stylesheets false
      g.test_framework false
    end

    # Settings in config/environments/* take precedence over those specified
    # here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # Set Time.zone default to the specified zone and make Active Record
    # auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names.
    # Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    # The default locale is :en and all translations from
    # config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path
    # += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.serve_static_assets = true
    config.assets.initialize_on_precompile = false
    config.i18n.enforce_available_locales = true

    config.to_prepare do
      Devise::SessionsController.layout SESSIONS
      Devise::RegistrationsController.layout REGISTRATION
      Devise::ConfirmationsController.layout REGISTRATION
      Devise::UnlocksController.layout REGISTRATION
      Devise::PasswordsController.layout REGISTRATION
    end
  end
end
