require 'tsort'
require_relative 'lib/delayer/deferred/version'

class Hash
  include TSort
  alias tsort_each_node each_key
  def tsort_each_child(node, &block)
    fetch(node).each(&block)
  end
end

MRuby::Gem::Specification.new('mruby-delayer-deferred') do |spec|
  spec.license     = 'MIT'
  spec.authors     = ['Toshiaki Asai', 'shibafu528']
  spec.version     = Delayer::Deferred::VERSION
  spec.summary     = %q{Deferred for Delayer}

  external_rb_require = %w[delayer thread]
  require_graph = external_rb_require.map {|item| [item, []] }.to_h
  Dir["#{__dir__}/lib/**/*.rb"].each { |file|
    require_graph[file[/\A#{__dir__}\/lib\/(.*)\.rb\Z/, 1]] = File.readlines(file).grep(/^#require/) {|g| g.scan(/^#require ["'](.*)["']/) }.flatten
  }
  spec.rbfiles = (require_graph.tsort - external_rb_require).map { |file| File.expand_path("#{__dir__}/lib/#{file}.rb") }
  
  spec.add_dependency 'mruby-struct'
  spec.add_dependency 'mruby-catch-throw'
  spec.add_dependency 'mruby-delayer', :github => 'shibafu528/mruby-delayer'
end
