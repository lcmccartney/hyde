require 'erb'

class FileMaker

  def create_dir(path)
    return "Directory already exists!" if Dir.exist?(File.join(Dir.home, "#{path}"))
    Dir.mkdir(File.join(Dir.home, "#{path}"))
  end

  def create_dir_structure(path)
    create_dir("#{path}/_output")
    create_dir("#{path}/_output/css")
    create_dir("#{path}/_output/pages")
    create_dir("#{path}/_output/posts")
    create_dir("#{path}/_output/tags")
    create_dir("#{path}/source")
    create_dir("#{path}/source/posts")
    create_dir("#{path}/source/css")
    create_dir("#{path}/source/pages")
    create_dir("#{path}/source/layouts")

  end

  def create_file(path, content)
    File.write(File.join(Dir.home, "#{path}"), "#{content}")
  end

  def create_file_structure(path)
    create_file("#{path}/source/index.markdown", "STUFF")
    create_file("#{path}/source/css/main.css", "COOLSTUFF")
    create_file("#{path}/source/pages/about.markdown", "WOWZA")
    create_file("#{path}/source/posts/#{date}-welcome-to-hyde.markdown", "RRRR")
    create_file("#{path}/source/layouts/default.html.erb", File.read("./lib/site_templates/post.txt"))
  end

  def date
    date = Time.new
    date.strftime('%Y-%m-%d')
  end
end
