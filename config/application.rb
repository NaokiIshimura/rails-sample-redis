require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RedisTest
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #config.cache_store = :redis_store, "redis://test-redis.jtn6nh.0001.apse1.cache.amazonaws.com:6379/0/cache", { expires_in: 90.minutes }
    config.cache_store = :redis_store, {
      host: "test-redis.jtn6nh.0001.apse1.cache.amazonaws.com",
      port: 6379,
      db: 0,
      #password: "mysecret",
      namespace: "cache"
    }
  end
end
