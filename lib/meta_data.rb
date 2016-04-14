class MetaData

  def find_meta_data(content)
    split_contents = content.split('---')
    split_contents = split_contents[1].strip.split(":")
    meta_hash = { split_contents[0] => split_contents[1]}
  end

  def downcase_tags(tags)
    tags.map do |key, value|
      value.downcase
    end
  end

  def snake_case(tags)
    tags.map do |key, value|
      # require 'pry' ; binding.pry
      value.sub(" ", "_")
    end
  end

  def turn_tags_into_hash(tags)
    { "tags" => tags }
  end

  def formatted_hash(tags)
    downcased_tags = downcase_tags(tags)
    formatted_tags = snake_case(downcased_tags)
    turn_tags_into_hash(formatted_tags)
  end


end
