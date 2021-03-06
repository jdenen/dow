# DOW

DOW is a simple command line application to determine the day of the week ("Wednesday") for a given date.

## Installation

Download and unpack one of the following OSX tarballs. NOTE: You do not need Ruby installed to use the app.

[Ruby 2.2.2](https://s3.amazonaws.com/dow-release/ruby-2.2.2/dow-2.2.2-osx.tar.gz)

[Ruby 2.1.6](https://s3.amazonaws.com/dow-release/ruby-2.1.6/dow-2.1.6-osx.tar.gz)

## Usage

On your command line, call the dow application without arguments to get today's day of the week.

	$ ./dow-2.2.2-osx/dow

You can call the application with `--day`, `--month`, or `--year` arguments to specify another date. Arguments not given will assume today's equivalent. For example,
`dow -m 12` will return the day of the week for this day in December of this year and `dow -m 12 -d 25` will return the day of the week for Christmas this year.

Use `--help` to see your options on the command line.

	$ ./dow-2.2.2-osx/dow --help

## Development

After checking out the repo, run `bundle install` to install dependencies. Run `rake spec:unit` to execute unit tests.

Use `rake package:#{platform}` to package the app using [traveling-ruby](https://github.com/phusion/traveling-ruby). Use `rake -T` to see your packaging options. Note: Make sure you're using either Ruby 2.1.6 or 2.2.2 (`rbenv version`) before packaging.

After building, run `rake spec:smoke` to test the packaged app.

## Next steps

The next version of the app should remove the need for `-m`, `-d`, and `-y` options. It should interpret its arguments and prompt the user for clarification as needed. Examples:

	$ dow 12 25
	$ dow 1 1 2020
	$ dow 14 3

I'd also like to implement an option for finding the date of the next day of the week. For example, `dow wednesday` or `dow wed` would return next Wednesday's date.

## Continuous delivery

The [dow-ci](https://github.com/jdenen/dow-ci) repository contains Jenkins [job scripts](https://github.com/jenkinsci/job-dsl-plugin) that handle the testing and packaging of this application for 2 Ruby versions (2.1.6 and 2.2.2) and 3 platforms (OSX, Linux x86, and Linux x86_64). Passing OSX builds are auto-delivered to s3 and available for download.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jdenen/dow

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

