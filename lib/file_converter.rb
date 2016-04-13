require 'kramdown'

class FileConverter

  include PostMod

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
      content = File.read(file)
      html = Kramdown::Document.new(content).to_html
      File.new(new_path, 'w+')
      File.write(new_path, html)
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
      File.write(new_path, html)
    end
  end

end
