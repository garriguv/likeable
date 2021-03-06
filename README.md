# likeable

`likeable` will create a playlist based on your followings' likes during the specified month.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'likeable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install likeable

## Usage

```
Usage:
  likeable create_playlist -m, --month=N -y, --year=N

Options:
  -y, --year=N                       # Selected year for your following's likes
  -m, --month=N                      # Selected month for your following's likes
  -d, --duration=N                   # Max duration in minutes of each track that should be selected
      [--top], [--no-top]            # Order tracks by number of likes
      [--client-id=CLIENT_ID]
      [--access-token=ACCESS_TOKEN]

Create a playlist made of your following's likes
```

If you don't want to have to pass you client id and access token all the time, copy `.likeable.yml.sample` to `.likeable.yml` and replace `CLIENT_ID` and `ACCESS_TOKEN` with your client id and access token.

## Contributing

1. Fork it ( https://github.com/garriguv/likeable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
6. You're awesome! :+1:

## License

See `LICENSE.txt`
