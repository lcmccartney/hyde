require_relative 'test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_maker'

class FileMakerTest < Minitest::Test

  def setup
    @file_maker = FileMaker.new
  end

  def test_it_creates_the_first_directory
    @file_maker.create_dir("my_blog")
    assert Dir.exist?(File.join(Dir.home, "my_blog"))
  end

  def test_it_errors_if_dir_exists
    @file_maker.create_dir("my_blog")
    assert_equal "Directory already exists!", @file_maker.create_dir("my_blog")
  end

  def test_it_creates_sub_folders
    @file_maker.create_dir("my_blog")
    @file_maker.create_dir_structure("my_blog")
    assert Dir.exist?(File.join(Dir.home, "/my_blog/_output"))
  end

  def test_it_creates_files
    @file_maker.create_dir("my_blog")
    @file_maker.create_dir_structure("my_blog")
    @file_maker.create_file("/my_blog/source/index.markdown", "index.markdown")
    assert File.exist?(File.join(Dir.home, "/my_blog/source/index.markdown"))
  end

  def test_it_creates_multiple_files
    @file_maker.create_dir("my_blog")
    @file_maker.create_dir_structure("my_blog")
    @file_maker.create_file_structure("/my_blog")
    assert File.exist?(File.join(Dir.home, "/my_blog/source/pages/about.markdown"))
  end

end
