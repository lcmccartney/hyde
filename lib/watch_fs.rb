require 'listen'

class WatchFs

  def start_listening(path)
    listener = Listen.to("#{Dir.home}/#{path}/source") do |modified, _added, _removed|
      puts "modified absolute path: #{modified}"
      build(path)
    end
    listener.start
    sleep
  end

  def build(path)
    fileconverter = FileConverter.new
    fileconverter.markdown_to_html(path)
    fileconverter.md_to_html(path)
  end

end
