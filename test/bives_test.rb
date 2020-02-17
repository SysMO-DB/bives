require 'minitest'
require "minitest/autorun"
require_relative '../lib/bives'

class BivesTest < MiniTest::Unit::TestCase
  include Bives

  def setup
    @potato1 = File.expand_path('../models/potato1.xml', __FILE__)
    @potato2 = File.expand_path('../models/potato2.xml', __FILE__)

    assert File.exist?(@potato1)
    assert File.exist?(@potato2)
  end

  def test_compare
    result = compare(@potato1,@potato2)
    refute_nil result
    refute_empty result.strip
  end

  def test_exception_thrown
    exception = assert_raises Bives::ConversionException do
      compare("","",[])
    end
    assert_includes exception.message,"no file provided"
  end

end