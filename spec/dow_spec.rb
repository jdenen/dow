require 'spec_helper'

describe DOW do
  it 'has a version number' do
    expect(DOW::VERSION).not_to be nil
  end

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
        expect(subject.date 12, 20, 2010).to eq "Monday"
      end
    end
  end
end
