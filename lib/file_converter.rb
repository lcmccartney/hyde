require 'kramdown'
require 'erb'

class FileConverter

  def find_markdown(path)
    Dir[(File.join(Dir.home, "#{path}/source/**/*.markdown"))]
  end

  def find_md(path)
    Dir[(File.join(Dir.home, "#{path}/source/**/*.md"))]
  end

  def markdown_to_html(path)
    find_markdown(path).each do |file|
      new_path = file.sub("source", "_output")
      new_path = new_path.split(".")
      new_path = new_path[0] << '.html'
      content = File.read(file) #this is reading the markdown file
      html = Kramdown::Document.new(content).to_html #takes the mardkdown and converts it to html
      File.new(new_path, 'w+')
      # content = ERB.new(File.read("./lib/site_templates/default.txt")).result(binding)
      content = ERB.new(File.read(File.join(Dir.home, "#{path}/source/layouts/default.html.erb"))).result(binding)
      File.write(new_path, content) #spits out the html file in _outputs
      # File.write(new_path, html)
    end
  end

  def md_to_html(path)
    find_md(path).each do |file|
      new_path = file.sub("source", "_output")
      new_path = new_path.split(".")
      new_path = new_path[0] << '.html'
      content = File.read(file)
      html = Kramdown::Document.new(content).to_html
      File.new(new_path, 'w+')
      full_html = ERB.new(File.read("./lib/site_templates/post.txt")).result(binding)
      File.write(new_path, full_html)
      # File.write(new_path, html)
    end


  end

end
