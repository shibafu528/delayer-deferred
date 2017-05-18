# -*- coding: utf-8 -*-

module Delayer::Deferred
  Error = Class.new(StandardError)

  class ForeignCommandAborted < Error
    attr_reader :process
    def initialize(message, options = {})
      options = {process: nil}.merge(options)
      super(message)
      @process = options[:process]
    end
  end
end
