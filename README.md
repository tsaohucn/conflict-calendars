# Conflict Calendars

The gem help people find the conflicting calendars from given calendars

## Welcome for PR
The gem need extend and raise, if you have any interests, welocome pull request.

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
Require the library first

```ruby
require "conflict/calendars"
```

Create calendar object by this way, you can type the name of calendar or not.

```ruby
calendar_A = Ccs::Calendar.new("enter the name of calendar", ,"2016-12-10 08:00", "2016-12-10 13:00")
calendar_B = Ccs::Calendar.new("2016-12-10 09:00", "2016-12-10 10:30")
calendar_C = Ccs::Calendar.new("2016-12-10 10:00", "2016-12-10 12:30")
calendar_D = Ccs::Calendar.new("2016-12-10 15:00", "2016-12-10 17:30")
calendar_E = Ccs::Calendar.new("2016-12-10 15:20", "2016-12-10 16:30")
```
Over here we have five calendars, we wanna know who are conflicting? 
So we just do that :

```ruby
conflicts = Ccs::Conflicts.new(calendar_A,calendar_B,calendar_C,calendar_D,calendar_E)

p conflicts #=> <Ccs::Conflict:0x007fba211e9d20 {2}>

puts conflicts.size #=> 2
```

Now, you know there are exist two conflicting sets.
Then you can get each information of calendar by this way :

```ruby
conflicts.each do |conflict|
  p conflict #=> <Set: {#<Ccs::Calendar:0x007fb..>, #<Ccs::Calendar:0x007fc..>} >
  conflict.each do |calendar|
    p calendar #=> <Ccs::Calendar>
    puts calendar.calendarname #=> "calendarname"
    puts calendar.stime #=> 2016-12-10 09:00
    puts calendar.etime #=> 2016-12-10 10:30
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/conflict-calendars. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

