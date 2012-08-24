require 'vcr'
require 'vcr_cable/railtie' if defined? Rails

module VcrCable
  CONFIG_FILE = 'vcr_cable.yml'

  def self.configure_vcr
    VCR.configure do |c|
      c.hook_into config['hook_into']
      c.cassette_library_dir = config['cassette_library_dir']
      c.allow_http_connections_when_no_cassette = config['allow_http_connections_when_no_cassette']
    end
  end

  def self.config
    @config ||= YAML.load_file(Rails.root.join 'config', CONFIG_FILE)[Rails.env]
  end
end
