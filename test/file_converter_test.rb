require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_converter'

class FileConverterTest < Minitest::Test

  def setup
    @file_converter = FileConverter.new
  end

  def test_it_can_find_markdown_files
    assert File.exist?("*.md"), @file_converter.find_markdown("my-blog")
  end

  def test_it_can_use_kramdown_to_convert_to_html
    assert File.exist?("*.html"), @file_converter.markdown_to_html("my-blog")
  end

end
