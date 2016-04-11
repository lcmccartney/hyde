require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_maker'

class FileMakerTest <Minitest::Test

  def test_it_creates_the_first_directory
    filemaker = FileMaker.new
    filemaker.create_dir("my-blog")
    assert Dir.exists?(File.join(Dir.home, "my-blog"))
  end

  def test_it_errors_if_dir_exists
    filemaker = FileMaker.new
    filemaker.create_dir("my-blog")
    assert_equal "Directory already exists!", filemaker.create_dir("my-blog")
  end

end
