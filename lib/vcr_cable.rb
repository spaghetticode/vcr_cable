require 'vcr'
require 'vcr_cable/railtie' if defined? Rails

module VcrCable
  class InvalidMockingLibraryError < ArgumentError; end;
  extend self

  CONFIG_FILE = 'vcr_cable.yml'
  DEFAULT_CONFIG = {
    'development' => {
      'cassette_library_dir' => 'development_cassettes',
      'allow_http_connections_when_no_cassette' => true
    }
  }

  def configure_vcr
    VCR.configure do |c|
      c.hook_into config['hook_into']
      c.cassette_library_dir = config['cassette_library_dir']
      c.allow_http_connections_when_no_cassette = config['allow_http_connections_when_no_cassette']
    end
  end

  def config
    @config ||= default_config.merge local_config
  end

  def enabled?
    config.present? && !config['disable_vcr_cable']
  end

  def disabled_by_env?
    %w(true 1).include?(ENV['DISABLE_VCR_CABLE'])
  end

  def reset_config
    %w[local_config config_file default_config config].each do |name|
      instance_variable_set "@#{name}", nil
    end
  end

  private

  def env
    Rails.env
  end

  def local_config
    @local_config ||= if File.file? config_file
      YAML.load(ERB.new(config_file.read).result).fetch env, {}
    else
      {}
    end
  end

  def config_file
    @config_file ||= Rails.root.join 'config', CONFIG_FILE
  end

  def default_config
    @default_config ||= if DEFAULT_CONFIG.has_key? env
      DEFAULT_CONFIG[env].merge({
        'hook_into' => select_default_mocking_library,
        'disable_vcr_cable' => disabled_by_env?
      })
    else
      {}
    end
  end

  def select_default_mocking_library
    if gem_available? 'fakeweb'
      :fakeweb
    elsif gem_available? 'webmock'
      :webmock
    else
      raise InvalidMockingLibraryError.new(
        "A valid mocking framework was not supplied - Add FakeWeb or WebMock to Gemfile"
      )
    end
  end

  # http://stackoverflow.com/questions/1032114/check-for-ruby-gem-availability#answer-7455576
  def gem_available?(name)
    Gem::Specification.find_by_name(name)
  rescue Gem::LoadError
    false
  rescue
    Gem.available?(name)
  end
end
