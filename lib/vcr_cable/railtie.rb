module VcrCable
  class Railtie < Rails::Railtie
    initializer 'vcr_cable.insert_middleware' do |app|
      app.config.middleware.use VCR::Middleware::Rack do |cassette|
        cassette.name 'vcr_cable'
        cassette.options :record => :new_episodes
      end
      VcrCable.configure_vcr
    end
  end
end
