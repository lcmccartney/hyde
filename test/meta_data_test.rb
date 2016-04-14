require 'minitest/autorun'
require 'minitest/pride'
require './lib/meta_data'
require_relative 'test_helper'

class MetaDataTest < Minitest::Test

  def setup
    @meta_data = MetaData.new
    @test_helper = TestHelper.new
  end

  def test_it_can_find_tags
    assert_equal ({"tags"=>" Italian Food, flatbread"}) , @meta_data.find_meta_data(@test_helper.meta_helper)
  end

  def test_it_can_downcase_tags
    assert_equal ["italian food, flatbread"] , @meta_data.downcase_tags({"tags" => "Italian Food, flatbread"})
  end

  def test_it_can_turn_spaces_into_snake_case
    assert_equal ["italian_food, flatbread"], @meta_data.snake_case({"tags" => "Italian Food, flatbread"})
  end

  def test_it_can_format_hash_with_downcase_and_snake_case
    assert_equal ({"tags"=> ["italian_food, flatbread"] }) , @meta_data.formatted_hash({"tags" => "Italian Food, flatbread"})
  end

end
