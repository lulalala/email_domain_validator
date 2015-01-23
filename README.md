# EmailDomainValidator

Email address's domain validator by checking presence of MX and A record.

Extra filters are available such as caching and whitelisting.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'email_domain_validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install email_domain_validator

## Usage

Validate email:

    v = EmailDomainValidator.new
    v.valid?('saki@yahoo.co.jp')

Add cache filter

    v.add_filter(:rails_cache, expires_in: 12.hours)
    v.valid?('saki@yahoo.co.jp')
    v.valid?('amy@yahoo.co.jp') # same domain will not be checked again

## Filters

### dummy

Always returns true. Useful for testing or development purposes.

    v.add_filter(:dummy)

### rails_cache

Use Rails' caching capability to cache lookup results. Options used in Rails caching such as :expires_in can be used here.

    v.add_filter(:rails_cache, expires_in: 12.hours, race_condition_ttl: 1)

### whitelist

Declare a whitelist of domains which will always be considered valid.

    v.add_filter(:whitelist, ['yahoo.com.tw', 'gmail.com'])

## Contributing

1. Fork it ( https://github.com/lulalala/email_domain_validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
