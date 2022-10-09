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

  def test_client_initialization_with_width
    client = StabilitySDK::Client.new(api_key: "test")

    assert_raises StabilitySDK::InvalidParameter do
      client.generate("test", { width: 1 })
    end

    assert_raises StabilitySDK::InvalidParameter do
      client.generate("test", { width: 8 })
    end

    assert_raises StabilitySDK::InvalidParameter do
      client.generate("test", { width: 63 })
    end

    assert_raises StabilitySDK::InvalidParameter do
      client.generate("test", { width: 100 })
    end
  end

  def test_client_initialization_with_height
    client = StabilitySDK::Client.new(api_key: "test")

    assert_raises StabilitySDK::InvalidParameter do
      client.generate("test", { height: 1 })
    end

    assert_raises StabilitySDK::InvalidParameter do
      client.generate("test", { height: 8 })
    end

    assert_raises StabilitySDK::InvalidParameter do
      client.generate("test", { height: 63 })
    end

    assert_raises StabilitySDK::InvalidParameter do
      client.generate("test", { height: 100 })
    end
  end
end
