require "date"

module DOW
  module Converter
    extend self

    def date month: today.month, day: today.day, year: today.year
      Date.new(year, month, day).strftime('%A')
    end

    private

    def today
      @date ||= Date.today
    end
  end
end
