require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_converter'

class FileConverterTest < Minitest::Test

  def setup
    @file_converter = FileConverter.new
  end

  def test_it_can_find_markdown_files
    assert_equal ["/Users/lmac/my-blog/source/index.markdown", "/Users/lmac/my-blog/source/pages/about.markdown", "/Users/lmac/my-blog/source/posts/date-welcome-to-hyde.markdown"], @file_converter.find_markdown("my-blog")
  end

  def test_it_can_use_kramdown_to_convert_markdown_to_html
    assert @file_converter.markdown_to_html("my-blog")
  end

  def test_it_can_use_kramdown_to_convert_md_to_html
    assert @file_converter.md_to_html("my-blog")
  end

end
