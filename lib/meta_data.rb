require_relative 'file_maker'

class MetaData

  def format_tags_and_make_tag_files(tags)
    downcased = downcase_tags(tags)
    formatted_tags = snake_case(downcased)
    make_files_for_tags(formatted_tags)
  end

  def find_meta_data(content)
    split_contents = content.split('---')
    split_contents = split_contents[1].strip.split(":")
    meta_hash = { split_contents[0] => tags = split_contents[1].lstrip.split(", ")}
  end

  def downcase_tags(tags)
    tags.map do |key, value|
      value.downcase
    end
  end

  def snake_case(tags)
    tags.map do |tag|
      tag.sub(" ", "_").split(",_").join(", ")
    end
  end

  def make_files_for_tags(tags)
    tags[0].split(", ").map do |tag|
      FileMaker.new.create_file("/my-blog/_output/tags/#{tag}.html", "#{tag}")
    end
  end

end
