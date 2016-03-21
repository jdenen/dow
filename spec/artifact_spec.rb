require "spec_helper"

describe DOW, :artifact do
  context "without arguments" do
    it "prints today's day of the week" do
      today = Date.today.strftime('%A')
      output = IO.popen("spec/support/dow")
      expect(output.readlines.first.strip).to eq today
    end
  end

  context "with date arguments" do
    it "prints the correct day of the week" do
      output = IO.popen("spec/support/dow -m 12 -d 25 -y 2015")
      expect(output.readlines.first.strip).to eq "Friday"
    end
  end

  context "with --version argument" do
    it "prints the gem version" do
      output = IO.popen("spec/support/dow -v")
      expect(output.readlines.first.strip).to eq DOW::VERSION
    end
  end

  context "with --help argument" do
    it "prints the help text" do
      output = IO.popen("spec/support/dow -h")
      expect(output.readlines.first.strip).to match /^Find the day of the week. Usage/
    end
  end
end
