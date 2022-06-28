require 'active_support/core_ext/module'
require 'junctions/engine'
require "junctions/version"

module Junctions
  class << self
    delegate :core=, :junction_list=, :activate, to: Junctions::Engine

    def included(base)
      Junctions::Engine.activate(base, self.name)
    end
  end
end
