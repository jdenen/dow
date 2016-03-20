require "spec_helper"

describe DOW::Converter do
  describe ".today" do
    it "returns today's day of the week string" do
      allow(Date).to receive(:today).and_return(Date.new 2010, 1, 1)
      expect(subject.today).to eq "Friday"
    end
  end

  describe ".date" do
    context "without arguments" do
      it "returns today's day of the week string" do
        allow(Date).to receive(:today).and_return(Date.new 2010, 1, 1)
        expect(subject.date).to eq "Friday"
      end
    end

    context "with month, day, and year arguments" do
      it "returns a day of the week string" do
        expect(subject.date month: 12, day: 20, year: 2010).to eq "Monday"
      end
    end

    context "with year argument only" do
      it "returns day of the week for today's date in the given year" do
        allow(Date).to receive(:today).and_return(Date.new 2010, 1, 1)
        expect(subject.date year: 2015).to eq "Thursday"
      end
    end

    context "with month and day arguments" do
      it "returns day of the week for given month/day in this year" do
        allow(Date).to receive(:today).and_return(Date.new 2010, 1, 1)
        expect(subject.date month: 4, day: 21).to eq "Wednesday"
      end
    end

    context "with day argument only" do
      it "returns day of the week for day in today's month/year" do
        allow(Date).to receive(:today).and_return(Date.new 2010, 1, 1)
        expect(subject.date day: 5).to eq "Tuesday"
      end
    end
  end
end
