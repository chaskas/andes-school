require 'ldclient-rb'

Rails.configuration.client = LaunchDarkly::LDClient.new(ENV['LAUNCHDARKLY_SDK_KEY'])