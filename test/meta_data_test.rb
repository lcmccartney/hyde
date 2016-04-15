require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/meta_data'


class MetaDataTest < Minitest::Test

  def setup
    @meta_data = MetaData.new
    @test_helper = TestHelper.new
  end

  def test_it_can_find_tags
    assert_equal ["Italian Food", "flatbread"], @meta_data.find_meta_data(@test_helper.meta_helper)
  end

  def test_it_can_downcase_tags
    assert_equal ["italian food, flatbread"] , @meta_data.downcase_tags({"tags" => "Italian Food, flatbread"})
  end

  def test_it_can_turn_spaces_into_snake_case
    assert_equal ["italian_food, flatbread"], @meta_data.snake_case(["italian_food, flatbread"])
  end

  def test_it_generates_tag_links
    assert_equal ["<a href='../tags/tag_one.html'>tag_one</a>", "<a href='../tags/tag_two.html'>tag_two</a>"], @meta_data.generate_tag_links("this_blog", ["tag_one", "tag_two"])
  end

end
