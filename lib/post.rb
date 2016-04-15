require_relative 'file_maker'

class Post

  def post(path, title)
    FileMaker.new.create_file("/#{path}/source/posts/#{date}-#{title}.markdown", body(title))
  end

  def body(title)
    "Your content here!"
  end

  def date
    date = Time.new
    date.strftime('%Y-%m-%d')
  end

end
