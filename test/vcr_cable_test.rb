require 'test_helper'

class VcrCableTest < ActiveSupport::TestCase
  setup { VcrCable.reset_config }

  test 'is enabled when config is present' do
    VcrCable.stubs(:config).returns({:some => :conf})
    assert VcrCable.enabled?
  end

  test 'is not enabled when config is not present' do
    VcrCable.stubs(:config).returns({})
    assert !VcrCable.enabled?
  end

  test 'is not enabled when config disables it' do
    VcrCable.stubs(:config).returns({'disable_vcr_cable' => true})
    assert !VcrCable.enabled?
  end

  test 'has no config when the current env has no configuration' do
    assert !VcrCable.config.present?
  end

  test 'loads config from config/vcr_cable.yml over default values' do
    VcrCable.stubs(:env).returns('development')
    VcrCable.configure_vcr
    assert_match /custom_named_cassettes$/, VCR.configuration.cassette_library_dir
  end

  test 'loads default values when not specified in config/vcr_cable.yml' do
    VcrCable.stubs(:env).returns('development')
    VcrCable.configure_vcr
    assert VcrCable.config['allow_http_connections_when_no_cassette']
  end

  test 'adds VCR::Middleware::Rack to the middleware stack' do
    list = Dir.chdir(Rails.root) {`bundle exec rake middleware RAILS_ENV=development`}
    assert_match /VCR::Middleware::Rack/, list
  end

  test 'it does not add VCR::Middleware::Rack to environments that are not enabled' do
    assert !Rails.configuration.middleware.any? {|name| name == 'VCR::Middleware::Rack'}
  end
end
