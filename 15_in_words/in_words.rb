module InWords
  def in_words
    numbers = self.to_s.chars.map(&:to_i)

    return "zero" if self  == 0

    string = ""
    string << high_orders(self)
    string << tens(numbers)
    string << ones(numbers)
   
    return string.strip
  end

  private

  # handles ones digit
  def ones(numbers)
    ones = %w[one two three four five six seven eight nine]
    if numbers[-1] != 0
      unless numbers[-2] == 1 
        return ones[numbers[-1] - 1] + " "
      else
        return ""
      end
    else
      return ""
    end
  end

  # handles tens digit
  def tens(numbers)
    tens = %w[twenty thirty forty fifty sixty seventy eighty ninety]
    teens = %w[eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]

    return "" if numbers[-2..-1].nil? || numbers[-2] == 0

    if numbers[-2..-1].join.to_i == 10
      return "ten "
    elsif numbers[-2] == 1
      return teens[numbers[-1] - 1] + " "
    elsif numbers[-2] > 1
      return tens[numbers[-2] - 2] + " "
    end
  end

  # handles higher order numbers
  def high_orders(number)
    string = ""

    orders = [[100, "hundred"],
              [1000, "thousand"], 
              [1_000_000, "million"], 
              [1_000_000_000, "billion"],
              [1_000_000_000_000, "trillion"]]

    orders.reverse.each do |limit, name|
      if number >= limit
        string << "#{(number / limit).in_words} #{name} "
        number %= limit
      end
    end
    return string
  end

end

class Fixnum
  include InWords 
end
