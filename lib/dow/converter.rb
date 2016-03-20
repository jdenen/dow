require "date"

module DOW
  module Converter
    extend self

    def date month: today.month, day: today.day, year: today.year
      ymd = [year, month, day].map(&:to_i)
      Date.new(*ymd).strftime('%A')
    end

    private

    def today
      @date ||= Date.today
    end
  end
end
