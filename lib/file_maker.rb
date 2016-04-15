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
    create_file("#{path}/source/layouts/default.html.erb", File.read("./lib/site_templates/default.txt"))
    create_file("#{path}/source/index.markdown", "this is where index content belongs")
    create_file("#{path}/source/css/main.css", File.read("./lib/site_templates/css.txt"))
    create_file("#{path}/source/pages/about.markdown", "this is where about content goes")
    create_file("#{path}/source/posts/#{date}-welcome-to-hyde.markdown", File.read("./lib/site_templates/welcome_post.txt"))
  end

  def date
    date = Time.new
    date.strftime('%Y-%m-%d')
  end
end
