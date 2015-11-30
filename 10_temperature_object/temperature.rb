class Temperature

  def initialize(options = {})
    @options = options
  end

  def self.from_celsius(t)
    self.new(:c => t)
  end

  def self.from_fahrenheit(t)
    self.new(:f => t)
  end

  def in_celsius
    if @options.has_key?(:c)
      return @options[:c]
    elsif @options.has_key?(:f)
      return ftoc(@options[:f])
    end
  end

  def in_fahrenheit
    if @options.has_key?(:f)
      return @options[:f]
    elsif @options.has_key?(:c)
      return ctof(@options[:c])
    end
  end

  def ctof(t)
    ((t * 9) / 5.0) + 32
  end

  def ftoc(t)
    ((t - 32) * 5) / 9.0
  end
end

class Celsius < Temperature
  def initialize(t)
    super(:c => t)
  end
end

class Fahrenheit < Temperature
  def initialize(t)
    super(:f => t)
  end
end

