require 'kramdown'

class FileConverter

  def find_markdown(path)
    # Dir["~/#{path}/source/**/*.markdown"]
    Dir[(File.join(Dir.home, "#{path}/source/**/*.markdown"))]
  end

  def markdown_to_html(path)
    find_markdown(path).each do |file|
      #use kramdown to create converted copies into the _output
      Kramdown::Document.new(file).to_html
    end
  end

end
