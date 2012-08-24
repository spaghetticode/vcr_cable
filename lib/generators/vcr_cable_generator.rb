class VcrCableGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc 'creates the default config file for VCR cable gem'
  def copy_default_config_file
    filename = VcrCable::CONFIG_FILE
    copy_file filename, "config/#{filename}"
  end
end
