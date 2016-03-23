require "rspec/core/rake_task"

namespace :spec do
  desc "Execute unit tests"
  RSpec::Core::RakeTask.new(:unit) do |task|
    task.rspec_opts = "-f RspecJunitFormatter -o result/unit-test.xml -f progress"
  end

  desc "Execute smoke tests"
  RSpec::Core::RakeTask.new(:smoke => 'spec:support') do |task| 
    ENV['TEST_ARTIFACT'] = '1'
    task.rspec_opts = "-f RspecJunitFormatter -o result/smoke-test.xml -f progress"
  end

  task :support do
    FileUtils.mkdir_p "spec/support"
    FileUtils.cp_r Dir.glob("dow-*/*"), "spec/support", :remove_destination => true
  end
end

namespace :package do
  ["osx", "linux-x86", "linux-x86_64"].each do |pf|
    desc "Package app for #{pf}"
    task "#{pf}" do
      ruby = IO.popen("ruby -v").readlines.first.strip.scan(/^ruby (.*)p/).flatten.first
      get_traveling(ruby, pf)
      FileUtils.mkdir_p "dow-#{ruby}-#{pf}/lib/ruby"
      %x{tar -xzf traveling-ruby-20150715-#{ruby}-#{pf}.tar.gz -C dow-#{ruby}-#{pf}/lib/ruby}
      FileUtils.cp_r Dir.glob("lib/**/*"), "dow-#{ruby}-#{pf}/lib"
      FileUtils.cp "wrapper.sh", "dow-#{ruby}-#{pf}/dow"
    end
  end

  def get_traveling ruby, platform
    tarball = "traveling-ruby-20150715-#{ruby}-#{platform}.tar.gz"
    %x{curl -L -O --fail http://d6r77u77i8pq3.cloudfront.net/releases/#{tarball}} unless File.exists?(tarball)
  end
end
