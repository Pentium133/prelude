require 'robe/server'
require 'robe/sash'

module Robe
  class << self
    attr_accessor :server

    def start(port)
      return if @server
      @server = Server.new(Sash.new, port)
      ['INT', 'TERM'].each do |signal|
        trap(signal) { stop }
      end
      Thread.new do
        unless Thread.current[:__yard_registry__]
          Thread.current[:__yard_registry__] = Thread.main[:__yard_registry__]
        end
        @server.start
      end
      nil # no output
    end

    def stop
      @server.shutdown
      @server = nil
    end
  end
end
