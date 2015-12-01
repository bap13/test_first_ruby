class RPNCalculator < Array

  ERROR_MESSAGE = "calculator is empty"
  
  attr_reader :value

  def plus
    calculate(:+)
  end

  def minus
    calculate(:-) 
  end

  def times
    calculate(:*)
  end

  def divide
    calculate(:/) 
  end

  def calculate(sym)
    fail ERROR_MESSAGE if self.size < 2
    @value = self.pop(2).map(&:to_f).reduce(sym)
    self.push(@value)
  end

  def tokens(string)
    string.split.map do |c|
      if c.match(/[+\-\*\/]/)
        c.to_sym
      elsif c.match(/[0-9]/)
        c.to_i
      end
    end
  end
  
  def evaluate(string)
    tokens(string).each do |token|
      if token.is_a?(Fixnum)
        self.push(token)
      elsif token.is_a?(Symbol)
        calculate(token)
      end
    end
    @value
  end
end
