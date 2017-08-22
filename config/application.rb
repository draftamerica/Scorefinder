require_relative 'boot'

require 'rails/all'

require 'json'
require 'net/http'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

def self.get_nfl_data(api_string)
    puts "/******get_nfl_data****"
    puts "/*****api_string, #{api_string.inspect}"
    HTTParty.get(api_string)
end

module ScoreFinder
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.autoload_paths << Rails.root.join('lib')

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
