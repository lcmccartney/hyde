require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_maker'

class FileMakerTest < Minitest::Test

  def setup
    @file_maker = FileMaker.new
  end

  def test_it_creates_the_first_directory
    @file_maker.create_dir("my-blog")
    assert Dir.exist?(File.join(Dir.home, "my-blog"))
  end

  def test_it_errors_if_dir_exists
    @file_maker.create_dir("my-blog")
    assert_equal "Directory already exists!", @file_maker.create_dir("my-blog")
  end

  def test_it_creates_sub_folders
    @file_maker.create_dir("my-blog")
    @file_maker.create_dir_structure("my-blog")
    assert Dir.exist?(File.join(Dir.home, "/my-blog/_output"))
  end

  def test_it_creates_files
    @file_maker.create_dir("my-blog")
    @file_maker.create_dir_structure("my-blog")
    @file_maker.create_files("/my-blog/source/index.markdown", "index.markdown")
    assert File.exist?(File.join(Dir.home, "/my-blog/source/index.markdown"))
  end

  def test_it_creates_multiple_files
    @file_maker.create_dir("my-blog")
    @file_maker.create_dir_structure("my-blog")
    @file_maker.create_file_structure("/my-blog")
  end

end
