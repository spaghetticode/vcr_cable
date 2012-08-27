require 'test_helper'

class VcrCableTest < ActiveSupport::TestCase
  test 'loads the default config' do
    File.stubs(:file?).returns false
    VcrCable.instance_variable_set('@config', nil)
    VcrCable.configure_vcr
    assert_match /development_cassettes$/, VCR.configuration.cassette_library_dir
  end

  test 'configuration in config/vcr_cable.yml overwrites default values' do
    VcrCable.configure_vcr
    assert_match /custom_named_cassettes$/, VCR.configuration.cassette_library_dir
  end

  test 'adds VCR::Middleware::Rack to the middleware stack' do
    assert Rails.configuration.middleware.any? {|name| name == 'VCR::Middleware::Rack'}
  end
end
