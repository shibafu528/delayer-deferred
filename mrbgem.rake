require_relative 'lib/delayer/deferred/version'

MRuby::Gem::Specification.new('mruby-delayer-deferred') do |spec|
  spec.license     = 'MIT'
  spec.authors     = ['Toshiaki Asai', 'shibafu528']
  spec.version     = Delayer::Deferred::VERSION
  spec.summary     = %q{Deferred for Delayer}
  
  spec.add_dependency 'mruby-struct', :core => 'mruby-struct'
  spec.add_dependency 'mruby-delayer', :github => 'shibafu528/mruby-delayer'
end
