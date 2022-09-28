require "test_helper"

class StabilitySDKTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::StabilitySDK::VERSION
  end

  def test_client_initialization
    client = StabilitySDK::Client.new(api_key: "test cred")
    assert client.is_a? StabilitySDK::Client
  end

  def test_client_initialization_with_params
    client = StabilitySDK::Client.new(api_key: "test cred", timeout: 30)
    assert client.is_a? StabilitySDK::Client
  end
end
