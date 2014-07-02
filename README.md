# VcrCable

[![Build Status](https://secure.travis-ci.org/spaghetticode/vcr_cable.png)](http://travis-ci.org/spaghetticode/vcr_cable)

This gem allows to use VCR in development. This is quite handy when your app
interacts frequently with external services and you're on a sloppy connection,
or when you want to save bandwidth, or when you happent to have no connection
at all.


## Usage

Add required gems to your Gemfile:

```ruby
gem 'vcr_cable'
gem 'fakeweb' # or webmock
```

You can choose between fakeweb and webmock gems for faking web requests. Now all external requests will hit the remote servers only one time, and the application will subsequently use the recorded data.


## Custom VCR Configuration

The default VCR configuration values are (extracted from ```lib/vcr_cable.rb```):

```ruby
  DEFAULT_CONFIG = {
    'development' => {
      'hook_into' => :fakeweb,
      'cassette_library_dir' => 'development_cassettes',
      'allow_http_connections_when_no_cassette' => true,
      'disable_vcr_cable' => false
    }
  }
```

If you want to override those values or configure vcr_cable to work in some
other environment you can generate the vcr_cable.yml config file and update it:

```bash
bundle exec rails generate vcr_cable
```

The file will be located in the ```config``` folder of your rails application.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add your feature tests to the test suite
4. Commit your changes (`git commit -am 'Added some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
