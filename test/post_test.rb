require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/post'

class PostTest < Minitest::Test

  def setup
    `bin/hyde new new_blog`
    `bin/hyde build new_blog`
  end

  def test_it_creates_a_new_post
    FileMaker.new.create_file("/new_blog/source/posts/new_post.markdown", "* content in the form of a list!")
    assert File.exist?(File.join(Dir.home << "/new_blog/source/posts/new_post.markdown"))
  end

  def test_it_creates_a_new_post_with_body
    Post.new.post("new_blog", "title")
    assert File.exist?(File.join(Dir.home << "/new_blog/source/posts/new_post.markdown"))
  end

  def test_it_can_return_a_body_to_a_file
    assert_equal "Your content here!", Post.new.body
  end
end
