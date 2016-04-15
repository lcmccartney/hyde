require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/post'


class PostTest < Minitest::Test

  def test_it_creates_a_new_post
    FileMaker.new.create_file("/my-blog/source/posts/new_post.markdown", "* content in the form of a list!")
    assert File.exist?(File.join(Dir.home << "/my-blog/source/posts/new_post.markdown"))
  end

  def test_it_creates_a_new_post_with_body
    Post.new.post("my-blog", "title")
    assert File.exist?(File.join(Dir.home << "/my-blog/source/posts/new_post.markdown"))
  end
end
