require 'FileUtils'

class FileMaker

  def create_dir(path)
    return "Directory already exists!" if Dir.exists?(File.join(Dir.home, "#{path}"))
    Dir.mkdir(File.join(Dir.home, "#{path}"))
  end

  def create_dir_structure(path)
    create_dir("#{path}/_output")
  end

end
