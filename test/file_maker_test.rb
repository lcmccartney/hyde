require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_maker'


class FileMakerTest <Minitest::Test

  def test_it_creates_the_first_directory
    filemaker = FileMaker.new
    assert Dir.exists?("my-blog"), filemaker.create_dir
  end

end
