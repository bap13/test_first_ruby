class Dictionary
  attr_reader :entries

  def initialize
    @entries = {}
  end

  def add(entry)
    @entries.merge!(entry.is_a?(Hash) ? entry : {entry => nil})
  end 

  def keywords
    @entries.keys.sort
  end

  def include?(key)
    @entries.has_key?(key)
  end

  def find(search_string)
    @entries.select { |k,v| k.match(/#{search_string}/) }
  end

  def printable
    printable_string = ''
    keywords.each do |k|
      printable_string << format("[%s] \"%s\"\n", k, @entries[k])
    end
    printable_string.chomp
  end
end
