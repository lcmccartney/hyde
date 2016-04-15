require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/meta_data'


class MetaDataTest < Minitest::Test

  def setup
    @meta_data = MetaData.new
    @test_helper = TestHelper.new
    `bin/hyde new blog`
    `bin/hyde build blog`
  end

  def test_it_can_find_tags
    assert_equal ({"tags"=>["Italian Food", "flatbread"]}), @meta_data.find_meta_data(@test_helper.meta_helper)
  end

  def test_it_can_downcase_tags
    assert_equal ["italian food, flatbread"] , @meta_data.downcase_tags({"tags" => "Italian Food, flatbread"})
  end

  def test_it_can_turn_spaces_into_snake_case
    assert_equal ["italian_food, flatbread"], @meta_data.snake_case(["italian_food, flatbread"])
  end

  def test_it_can_make_tag_files
    assert_equal [12, 9], @meta_data.make_files_for_tags(["italian_food, flatbread"])
  end

  # def test_it_can_return_empty_array_if_no_tags_are_given
  #   assert_equal "", @meta_data.parse_tags_and_make_tag_files("content", "")
  # end

end
