require 'minitest/unit'
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
    #puts compare(@potato1, @potato2)
    puts compare(@potato1,@potato2,["reportHtml"])
  end

end