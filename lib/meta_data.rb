require_relative 'file_maker'

class MetaData

  def parse_tags_and_make_tag_files(content, post_path, path)
    p "this thing is"
    p content.split("---")[1]
    return [] if content.split("---")[1] == nil
    tags = find_meta_data(content)
    p tags
    downcased = downcase_tags(tags)
    formatted_tags = snake_case(downcased)
    tag_paths = make_files_for_tags(formatted_tags, post_path, path)
    tagfile_links = generate_tag_links(post_path,tag_paths)
    tagfile_links
  end

  # def make_tag_files
  #   tag_paths = make_files_for_tags(formatted_tags, post_path, path)
  #   tagfile_links = generate_tag_links(post_path,tag_paths)
  #   tagfile_links
  # end

  def find_meta_data(content)
    split_contents = content.split('---')
    split_contents = split_contents[1].strip.split(":")
    split_contents[1].lstrip.split(", ")
  end

  def downcase_tags(tags)
    tags.map do |value|
      p value
      value.downcase
    end
  end

  def snake_case(tags)
    tags.map do |tag|
      tag.sub(" ", "_").split(",_").join(", ")
    end
  end

  def make_files_for_tags(tags, post_path, path)
    tag_paths = []
    tags[0].split(", ").map do |tag|
      #FileMaker.new.create_file("#{path}/_output/tags/#{tag}.html", "#{tag}")
      tag_path = "#{path}/_output/tags/#{tag}.html"
      tag_paths << tag_path
      File.open(File.join(Dir.home,tag_path),"a") { |f|
        f.puts("<a href='#{post_path}'>#{post_path}</a>")
      }
    end
    tag_paths
  end

  def generate_tag_links(post_path,tag_paths)
    tagfile_links = []
    tag_paths.each do |tag_path|
      tagfile_links << "<a href='#{tag_path}'>#{tag_path}</a>"
    end
    tagfile_links
  end

end
