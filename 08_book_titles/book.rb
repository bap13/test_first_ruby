class Book
  attr_reader :title

  def title=(new_title)
    small_words = %w[a an and the in of]
    words = new_title.split(" ")
    words = [words[0].capitalize] +
      words[1..-1].map do |w| 
      if small_words.include?(w)
        w
      else
        w.capitalize   
      end
    end
    @title = words.join(" ")
  end
end
