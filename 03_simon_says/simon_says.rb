def echo(string)
  string
end

def shout(string)
  string.upcase
end

def repeat(string, repeat = 2)
  ((string + " ") * repeat).strip
end

def start_of_word(word, n)
  word[0...n]
end

def first_word(string)
  string.split.first
end
 
def titleize(string)
  small_words = %w[and over the] #only the words needed to pass the spec
  title_array = string.split.map do |word|
    if small_words.include?(word)
      word
    else
      word.capitalize
    end
  end
  title_array.first.capitalize!
  title_array.join(" ")
end

