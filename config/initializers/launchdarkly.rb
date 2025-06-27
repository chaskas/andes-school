require 'ldclient-rb'

# Load environment variables from .env file if it exists
if File.exist?(File.join(School::Engine.root, '.env'))
  require 'dotenv'
  Dotenv.load(File.join(School::Engine.root, '.env'))
end

if ENV['LAUNCHDARKLY_SDK_KEY'].present?
  Rails.configuration.client = LaunchDarkly::LDClient.new(ENV['LAUNCHDARKLY_SDK_KEY'])
else
  Rails.logger.warn "LaunchDarkly SDK key not found in environment variables. Using offline client."

  # Create a mock/offline client when no SDK key is provided
  config = LaunchDarkly::Config.new(offline: true)
  Rails.configuration.client = LaunchDarkly::LDClient.new("offline", config)
end
