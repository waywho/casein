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
    gem.summary = "A lightweight Ruby on Rails CMS, based on Bootstrap"
    gem.description = "Casein is an open-source CMS for Ruby on Rails."
    gem.files = Dir["Gemfile", "LICENSE", "Rakefile", "README.rdoc", "PUBLIC_VERSION.yml", "{lib}/**/*", "{app}/**/*", "{config}/**/*"]
    gem.email = "mail@russellquinn.com"
    gem.authors = ["Russell Quinn"]
    gem.homepage = "http://github.com/russellquinn/casein"
    gem.add_dependency("will_paginate", ["3.0.4"])
    gem.add_dependency("authlogic", ["3.3.0"])
    gem.add_dependency("jquery-rails")
  end
rescue
  puts "Jeweler or one of its dependencies is not installed."
end