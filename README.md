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
gem 'webmock' # or fakeweb
```
Now all external requests will hit the remote servers only one time, and the
application will subsequently use the recorded data.


## Custom VCR Configuration

The default VCR configuration values are (extracted from ```lib/vcr_cable.rb```):

```ruby
  DEFAULT_CONFIG = {
    'hook_into' => :fakeweb,
    'cassette_library_dir' => 'development_cassettes',
    'allow_http_connections_when_no_cassette' => true
  }
```

If you want to override those values you can generate the vcr_cable.yml config
file and edit its params:

```bash
bundle exec rails generate vcr_cable
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add your feature tests to the rspec/cucumber test suite
4. Commit your changes (`git commit -am 'Added some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
