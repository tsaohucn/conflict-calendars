# Conflict::Calendars

The gem help you find the conflict-calendars from calendars

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'conflict-calendars'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install conflict-calendars

## Usage

First you should create Ccs::Calendar object by this way

```ruby
calendar_A = Ccs::Calendar.new("enter the name of calendar",Time.new(2016,12,10,8,0),Time.new(2016,12,10,13,0)
#=> #<Ccs::Calendar:0x007f9892be85e8 @name="enter the name of calendar", @start_time=2016-12-10 08:00:00 +0800, @end_time=2016-12-10 13:00:00 +0800>
```
```ruby
calendar_B = Ccs::Calendar.new(Time.new(2016,12,10,9,0),Time.new(2016,12,10,10,30))
#=> #<Ccs::Calendar:0x007fa36c55bf38 @name=nil, @start_time=2016-12-10 09:00:00 +0800, @end_time=2016-12-10 10:30:00 +0800>
```
And then you can find the conflicts by this way

```ruby
conflicts = Ccs::Conflicts.new(calendar_A,calendar_B)
conflicts.size #=> 1
conflicts.each do |conflict|
  p conflict #=> #<Set: {#<Ccs::Calendar:0x007fb..>, #<Ccs::Calendar:0x007fc..>} >
end
```
Now, you can know there are exist two calendars that conflict in the same set.
So, you can do that :

```ruby
conflict.each do |calendar|
  p calendar #=> #<Ccs::Calendar:0x007fb..>
  p calendar.name #=> "enter the name of calendar"
  p calendar.start_time #=> "2016-12-10 08:00:00 +0800"
  p calendar.end_time #=> "2016-12-10 13:00:00 +0800"
end
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/conflict-calendars. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

