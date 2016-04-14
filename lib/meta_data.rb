class MetaData

  def format_tags(tags)
    downcased = downcase_tags(tags)
    snake_case(downcased)
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


end
