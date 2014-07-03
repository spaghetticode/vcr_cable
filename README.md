# VcrCable

[![Build Status](https://secure.travis-ci.org/spaghetticode/vcr_cable.png)](http://travis-ci.org/spaghetticode/vcr_cable)

This gem allows you to use VCR in development. This is quite handy when your app
interacts frequently with external services and you're on a sloppy connection,
or when you want to save bandwidth, or when you happen to have no connection
at all.


## Usage

Add the required gem(s) to your Gemfile:

```ruby
gem 'vcr_cable'
gem 'fakeweb' # or webmock
```

*Note: You can choose between the FakeWeb and WebMock gems for faking web requests. If one of those gems is already loaded by your application it will be used automatically.*

That's it! Now all external requests will hit the remote servers only one time, and the application will subsequently use the recorded data.

## Custom VCR Configuration

The default VCR configuration is:

```yaml
development:
  hook_into: fakeweb
  cassette_library_dir: development_cassettes
  allow_http_connections_when_no_cassette: true
  disable_vcr_cable: false
```

If you want to override those values or configure vcr_cable to work in some
other environment you can generate the `vcr_cable.yml` config file and update it:

```bash
bundle exec rails generate vcr_cable
```

The file will be located in the ```config``` folder of your rails application.

You can also disable vcr_cable by setting `DISABLE_VCR_CABLE=true` in your environment. This would allow each developer to opt into or out of vcr_cable on his/her own machine, for example.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add your feature tests to the test suite
4. Commit your changes (`git commit -am 'Added some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
