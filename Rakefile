require 'rake'
require 'rake/testtask'
require 'rdoc/task'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the Casein gem.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the Casein gem.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Casein'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "casein"
    gem.summary = "A lightweight CMS toolkit for Ruby on Rails, based on Bootstrap."
    gem.description = "A lightweight CMS toolkit for Ruby on Rails, based on Bootstrap."
    gem.files = Dir["Gemfile", "LICENSE", "Rakefile", "README.rdoc", "PUBLIC_VERSION.yml", "{lib}/**/*", "{app}/**/*", "{config}/**/*"]
    gem.email = "mail@russellquinn.com"
    gem.authors = ["Russell Quinn"]
    gem.license = "MIT"
    gem.homepage = "http://www.caseincms.com"
    gem.add_dependency("will_paginate", ["3.0.7"])
    gem.add_dependency("authlogic", ["3.4.3"])
    gem.add_dependency("scrypt", ["1.2.1"])
    gem.add_dependency("jquery-rails")
  end
rescue
  puts "Jeweler or one of its dependencies is not installed."
end