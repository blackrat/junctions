$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'test_helper'
require 'wibble'
require 'wobble'

class Junctions::Test < MiniTest::Spec
  describe Junctions do
    it 'is a module' do
      assert_kind_of Module, Junctions
    end
  end

  describe ::Wibble do
    it 'has to_s overridden' do
      assert_equal Wibble.new.to_s, 'metal'
    end

    it 'has a metal method' do
      assert Wibble.new.metal=='metal included too'
    end
  end

  describe ::Wobble do
    it 'overrides the to_s from metal with its own method' do
      assert Wobble.new.metal=='plastic included too'
    end
  end
end
