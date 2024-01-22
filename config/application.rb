require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module UploadBYFile
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.eager_load_paths << Rails.root.join('lib')


    if File.exist?(File.expand_path('application.yml', __dir__))
      config = YAML.safe_load(File.read(File.expand_path('application.yml', __dir__)))
      config.merge! config.fetch(Rails.env, {})
      config.each do |key, value|
        ENV[key] = value.to_s
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
