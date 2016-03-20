require "date"

module DOW
  module Converter
    extend self

    def today
      date
    end

    def date month: now.month, day: now.day, year: now.year
      Date.new(year, month, day).strftime('%A')
    end

    private

    def now
      @date ||= Date.today
    end
  end
end
