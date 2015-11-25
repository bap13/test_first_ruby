def translate(string)
  translated = string.split.map do |word|
    to_piglatin(word)
  end
  translated.join(" ")
end

def to_piglatin(word)
  translation = word.partition(/[aeiou](?<!qu)/)
  translation[0] << "ay"
  translation.rotate.join
end

