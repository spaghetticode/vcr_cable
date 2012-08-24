# VcrCable

This gem allows to use VCR in development. This is quite handy when you're on
a sloppy connection and your app interacts with external services, or when you
want to save bandwidth, or when you have no connection at all.

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

Update config/vcr_cable.yml with your custom settings, if necessary. Done

