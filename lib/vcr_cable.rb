require 'vcr'
require 'vcr_cable/railtie' if defined? Rails

module VcrCable
  extend self

  CONFIG_FILE = 'vcr_cable.yml'
  DEFAULT_CONFIG = {
    'development' => {
      'hook_into' => :fakeweb,
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
    @config ||= global_config[env] || {}
  end

  def enabled?
    config.present?
  end

  def reset_config
    %w[global_config env_config config_file  config].each do |name|
      instance_variable_set "@#{name}", nil
    end
  end

  def global_config
    @global_config ||= File.file?(config_file) ? YAML.load_file(config_file) : DEFAULT_CONFIG
  end

  private

  def env
    Rails.env
  end

  def config_file
    @config_file ||= Rails.root.join 'config', CONFIG_FILE
  end
end
