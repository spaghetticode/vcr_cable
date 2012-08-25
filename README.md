# VcrCable

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

Generate the vcr_cable.yml file with default VCR config:

```bash
bundle exec rails generate vcr_cable
```

Update config/vcr_cable.yml with your custom settings, if necessary. Now all
external requests will hit the remote servers only one time, and the application
will subsequently use the recorded data.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Add your feature tests to the rspec/cucumber test suite
4. Commit your changes (`git commit -am 'Added some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
