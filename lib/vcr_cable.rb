require 'vcr'
require 'vcr_cable/railtie' if defined? Rails

module VcrCable
  extend self

  CONFIG_FILE = 'vcr_cable.yml'
  DEFAULT_CONFIG = {
    'hook_into' => :fakeweb,
    'cassette_library_dir' => 'development_cassettes',
    'allow_http_connections_when_no_cassette' => true
  }

  def configure_vcr
    VCR.configure do |c|
      c.hook_into config['hook_into']
      c.cassette_library_dir = config['cassette_library_dir']
      c.allow_http_connections_when_no_cassette = config['allow_http_connections_when_no_cassette']
    end
  end

  def config
    @config ||= begin
      config_file = Rails.root.join 'config', CONFIG_FILE
      if File.file? config_file
        YAML.load_file(config_file)[Rails.env]
      else
        DEFAULT_CONFIG
      end
    end
  end
end
