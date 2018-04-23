$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../lib'))
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
      assert_equal 'metal included too', Wibble.new.metal
    end
  end

  describe ::Wobble do
    it 'overrides the to_s from metal with its own method' do
      assert_equal 'plastic included too', Wobble.new.metal
    end
  end
end
