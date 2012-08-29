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

  test 'loads the default config when current env has configuration' do
    File.stubs(:file?).returns(false)
    VcrCable.stubs(:env).returns('development')
    VcrCable.configure_vcr
    assert_match /development_cassettes$/, VCR.configuration.cassette_library_dir
  end

  test 'has no config when the current env has no configuration' do
    VcrCable.stubs(:env).returns('without_vcr_cable')
    assert !VcrCable.config.present?
  end

  test 'config in config/vcr_cable.yml overwrites default values' do
    VcrCable.configure_vcr
    assert_match /custom_named_cassettes$/, VCR.configuration.cassette_library_dir
  end

  test 'global_config contains all env specific configs' do
    %w[test development].each do |env_name|
      VcrCable.global_config.keys.include?(env_name)
    end
  end

  test 'adds VCR::Middleware::Rack to the middleware stack' do
    assert Rails.configuration.middleware.any? {|name| name == 'VCR::Middleware::Rack'}
  end

  test 'it does not add VCR::Middleware::Rack to environments that are not enabled' do
    list = Dir.chdir(Rails.root) {`bundle exec rake middleware RAILS_ENV=no_vcr`}
    assert_not_match /VCR::Middleware::Rack/, list
  end

end
