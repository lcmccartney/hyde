require 'kramdown'
require 'erb'
require_relative 'meta_data'

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
      content = File.read(file)
      title = new_path.split("/")[-1].split(".")[0]
      metadata_parser = MetaData.new
      tagfile_links = metadata_parser.parse_tags_and_make_tag_files(content,new_path,path)
      content = content.split("---").last.lstrip
      html = Kramdown::Document.new(content).to_html
      File.new(new_path, 'w+')
      content = ERB.new(File.read(File.join(Dir.home, "#{path}/source/layouts/default.html.erb"))).result(binding)
      File.write(new_path, content)
    end
  end

  def md_to_html(path)
    find_md(path).each do |file|
      new_path = file.sub("source", "_output")
      new_path = new_path.split(".")
      new_path = new_path[0] << '.html'
      content = File.read(file)
      title = new_path.split("/")[-1].split(".")[0]
      metadata_parser = MetaData.new
      tagfile_links = metadata_parser.parse_tags_and_make_tag_files(content,new_path,path)
      content = content.split("---").last.lstrip
      html = Kramdown::Document.new(content).to_html
      File.new(new_path, 'w+')
      content = ERB.new(File.read(File.join(Dir.home, "#{path}/source/layouts/default.html.erb"))).result(binding)
      File.write(new_path, content)
    end
  end



end
