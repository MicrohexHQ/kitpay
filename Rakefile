# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
require './lib/kitpay/version.rb'
Jeweler::Tasks.new do |gem|
  gem.name = "kitpay"
  gem.homepage = "http://payponty.github.io/kitpay"
  gem.license = "MIT"
  gem.summary = %Q{Gem for the PayPonty API}
  gem.description = gem.summary
  gem.email = "payponty.info@gmail.com"
  gem.authors = ["PayPonty"]
  gem.version = Kitpay::VERSION

end
Jeweler::RubygemsDotOrgTasks.new

task :default => :spec

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :test => :spec
task :default => :spec

namespace :doc do
  require 'yard'
  YARD::Rake::YardocTask.new do |task|
    task.files   = ['README.md', 'LICENSE.md', 'lib/**/*.rb']
    task.options = [
      '--output-dir', 'doc/yard',
      '--markup', 'markdown',
    ]
  end
end
