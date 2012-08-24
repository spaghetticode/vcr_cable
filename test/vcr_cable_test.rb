require 'test_helper'

class VcrCableTest < ActiveSupport::TestCase
  test 'it loads the default config' do
    VcrCable.config_vcr
    assert_match /test_cassettes$/, VCR.configuration.cassette_library_dir
  end

  test 'adds VCR::Middleware::Rack to the middleware stack' do
    Dir.chdir Rails.root do
      assert `rake middleware`.include?('use VCR::Middleware::Rack')
    end
  end
end
