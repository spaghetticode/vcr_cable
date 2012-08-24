require 'vcr'
require 'vcr_cable/railtie' if defined? Rails

module VcrCable
  DEFAULT_CONFIG = {
    :cassette_lib => "#{Rails.env}_cassettes",
    :hook_into    => :fakeweb,
    :allow_conn   => true,
    :environments => [:development]
  }

  # allow to load config from a config file, or to change it via initializer...
  # which is better?
  def self.config_vcr
    VCR.configure do |c|
      c.cassette_library_dir = DEFAULT_CONFIG[:cassette_lib]
      c.hook_into DEFAULT_CONFIG[:hook_into]
      c.allow_http_connections_when_no_cassette = DEFAULT_CONFIG[:allow_conn]
    end
  end
end
