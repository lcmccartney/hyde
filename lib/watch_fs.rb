require 'listen'

class WatchFs

  def start_listening(path)
    listener = Listen.to("~/blog/source") do |modified, added, removed|
      puts "modified absolute path: #{modified}"
      puts "added absolute path: #{added}"
      puts "removed absolute path: #{removed}"
    end
    listener.start
    sleep
  end

end
