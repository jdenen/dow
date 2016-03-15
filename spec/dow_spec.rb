require 'spec_helper'

describe DOW do
  it 'has a version number' do
    expect(DOW::VERSION).not_to be nil
  end

  describe ".today" do
    it "returns today's day of the week string" do
      expect(Date).to receive(:today).and_return(Date.new 2010, 1, 1)
      expect(subject.today).to eq "Friday"
    end
  end
end
