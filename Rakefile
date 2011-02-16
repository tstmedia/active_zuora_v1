require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "zuora4r"
    gem.version = "1.0.9"
    gem.summary = "Zuora4r"
    gem.description = "A client for Zuora API"
    gem.email = "gene@ning.com"
    gem.homepage = "http://github.com/cloocher/zuora4r"
    gem.authors = ["Cloocher"]
    gem.files = FileList["CHANGES", "zuora4r.gemspec", "Rakefile", "README", "VERSION",
        "lib/**/*", "bin/**/*"]
    gem.add_dependency "soap4r", ">= 1.5.8"
    gem.add_dependency "json_pure", ">= 1.4.6"
    gem.executables = ['zuora-query', 'zuora-create', 'zuora-update', 'zuora-bill-run', 'zuora-payment-run', 'zuora-delete', 'zq']
    gem.requirements = ["none"]
    gem.bindir = "bin"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "zuora4r #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
