require "date"

module DOW
  module Converter
    extend self

    class InvalidDateError < StandardError; end

    def date month: today.month, day: today.day, year: today.year
      ymd = [year, month, day].map(&:to_i)
      begin
        Date.new(*ymd).strftime('%A')
      rescue => e
        e.message.match(/invalid date/) ? raise(InvalidDateError) : e
      end
    end

    private

    def today
      @date ||= Date.today
    end
  end
end
