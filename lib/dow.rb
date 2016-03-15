require "dow/version"
require "date"

module DOW
  extend self

  def today
    Date.today.strftime('%A')
  end
end
