require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_converter'
require './lib/file_maker'

class FileConverterTest < Minitest::Test

  def setup
    @file_converter = FileConverter.new
    `bin/hyde new my-blog`
    `bin/hyde build my-blog`
  end

  def test_it_can_find_markdown_files
    assert_equal 3, @file_converter.find_markdown("my-blog").count
  end

  def test_it_can_use_kramdown_to_convert_markdown_to_html
    assert_equal 3, @file_converter.markdown_to_html("my-blog").count
  end

  def test_it_can_output_markdown_to_html
    assert File.exist?((File.join(Dir.home, "my-blog/_output/index.html")))
  end

  def test_it_can_use_kramdown_to_convert_md_to_html
    File.write(File.join(Dir.home, "my-blog/source/something.md"), "some content")
    File.write(File.join(Dir.home, "my-blog/source/posts/something_else.md"), "some content")
    assert_equal 2, @file_converter.md_to_html("my-blog").count
  end

  def test_it_can_output_md_to_html
    File.write(File.join(Dir.home, "my-blog/source/something.md"), "some content")
    File.write(File.join(Dir.home, "my-blog/source/posts/something_else.md"), "some content")
    @file_converter.md_to_html("my-blog")
    assert File.exist?((File.join(Dir.home, "my-blog/_output/posts/something_else.html")))
  end

end
