require 'kramdown'

class FileConverter

  def find_markdown(path)
    # Dir["~/#{path}/source/**/*.markdown"]
    Dir[(File.join(Dir.home, "#{path}/source/**/*.markdown"))]
  end

  def markdown_to_html(path)
    find_markdown(path).each do |file|
      # from spec: Kramdown::Document.new(markdown).to_html
      #use kramdown to create converted copies into the _output
      #need to extract contents from each file
      new_path = file.sub("source", "_output")
      require 'pry' ; binding.pry
      content = File.open(file)
      html = Kramdown::Document.new(content).to_html
      File.new(html, new_path)
      #put html into a file in the _output corresponding to source
    end
  end

end
