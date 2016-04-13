require 'minitest/autorun'
require 'minitest/pride'
require './lib/post'

class PostTest < Minitest::Test

  def test_it_creates_a_new_post
    assert File.exist?(File.join(Dir.home << "/my-blog/source/posts/new_post.markdown")), FileMaker.new.create_files("/my-blog/source/posts/new_post.markdown", "* content in the form of a list!")
  end

  def test_it_creates_a_new_post_with_body
    assert File.exist?(File.join(Dir.home << "/my-blog/source/posts/new_post.markdown")), Post.new.post("/my-blog", "title")
  end

end
