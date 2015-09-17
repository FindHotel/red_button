# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','redbutton','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'redbutton'
  s.version = RedButton::VERSION
  s.authors = ['Elod Peter', 'Alessandro Andreani', 'Luca Canducci']
  s.email = ['elod@innovativetravel.eu', 'alessandro@innovativetravel.eu', 'lucke84@gmail.com']
  s.homepage = 'http://innovativetravel.eu'
  s.platform = Gem::Platform::RUBY
  s.summary = ''
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = false
  s.bindir = 'bin'
  s.executables << 'redbutton'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('rspec')
  s.add_runtime_dependency('gli', '2.12.2')
  s.add_runtime_dependency('confiture', '0.1.4')
  s.add_runtime_dependency('git', '1.2.9')
end
