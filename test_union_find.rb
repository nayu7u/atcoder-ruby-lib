require "minitest/autorun"
require "./union_find"

class TestUnionFind < Minitest::Test
  def setup
    @union_find = UnionFind.new(5)
  end

  def test_size
    assert_equal 1, @union_find.size(1)
  end
end
