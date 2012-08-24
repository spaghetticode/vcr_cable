require 'test_helper'

class VcrCableTest < ActiveSupport::TestCase
  test 'loads the default config' do
    VcrCable.configure_vcr
    assert_match /test_cassettes$/, VCR.configuration.cassette_library_dir
  end

  test 'adds VCR::Middleware::Rack to the middleware stack' do
    assert Rails.configuration.middleware.any? {|name| name == 'VCR::Middleware::Rack'}
  end
end
