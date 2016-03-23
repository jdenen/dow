require_relative "converter"
require_relative "version"
require "optparse"

options = {}

OptionParser.new do |opts|
  opts.banner = "Find the day of the week. Usage: dow [options]"

  opts.on('-m', '--month', 'Month to convert') do
    options[:month] = ARGV.slice!(0)
  end

  opts.on('-d', '--day', 'Day to convert') do
    options[:day] = ARGV.slice!(0)
  end

  opts.on('-y', '--year', 'Year to convert') do
    options[:year] = ARGV.slice!(0)
  end

  opts.on('-t', '--today', 'Day of the week') do |t|
    options[:today] = t
  end

  opts.on('-v', '--version', 'Display dow version') do
    puts DOW::VERSION
    exit
  end

  opts.on('-h', '--help', 'Display this help text') do
    puts opts
    exit
  end
end.parse!

if options
  begin
    puts options[:today] ?
           DOW::Converter.date :
           DOW::Converter.date(options)
  rescue DOW::Converter::InvalidDateError
    puts "ERROR: That date does not exist!"
  end
end
