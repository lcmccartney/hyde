require_relative 'file_maker'

class Post

  def post(path, title)
    FileMaker.new.create_file("/#{path}/source/posts/#{date}-#{title}.markdown", body(title))
  end

  def body(title)
    "# #{title}\n\nAdd your content here!"
  end

  def date
    date = Time.new
    date.strftime('%Y-%m-%d')
  end

  #we want to be able to make # post title inserted when we make a post(argv[2]*)
  # Insert standard outline : body
  # Write the the file we just created and insert something like "Your content here"

end
