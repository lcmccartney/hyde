require 'listen'

class WatchFs

  def start_listening(path)
    listener = Listen.to("~/blog/source") do |modified|
      puts "modified absolute path: #{modified}"
    end
    listener.start
    sleep
  end

end
