require 'FileUtils'

class FileMaker

  def create_dir(path)
    Dir.mkdir(File.join(Dir.home, "#{path}"))
  end

end
