require 'FileUtils'


class FileMaker

  # def create_dir
  #   FileUtils.mkdir_p 'my-blog'
  # end

  def create_dir
    dirname = File.dirname("/my-blog")
    unless File.directory?(dirname)
      FileUtils.mkdir_p(dirname)
    end
  end


  # def create_dir(path, extension)
  #   dir = File.dirname(path)
  #
  #   unless File.directory?(dir)
  #     FileUtils.mkdir_p(dir)
  #   end
  #
  #   path << "my-blog"
  #   File.new(path, 'w')
  # end



end
