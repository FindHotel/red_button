# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','redbutton','version.rb'])
Gem::Specification.new do |s|
  s.name = 'redbutton'
  s.version = Redbutton::VERSION
  s.author = 'FindHotel'
  s.email = 'your@email.address.com'
  s.homepage = 'http://company.findhotel.net'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Prepare the release notes for the next version of your Rails app by simply pushing that big Red Button!'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','redbutton.rdoc']
  s.rdoc_options << '--title' << 'redbutton' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'redbutton'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('rspec')
  s.add_runtime_dependency('gli','2.12.2')
  s.add_runtime_dependency('git','1.18.0')
end
