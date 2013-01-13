$:.unshift File.expand_path("../lib", __FILE__)

require "bundler/gem_tasks"
require "bundler/setup"

require "rspec/core/rake_task"

task :default => :spec

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end
