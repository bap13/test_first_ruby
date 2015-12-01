class Array
  def sum
    return 0 if self.empty?
    self.reduce(:+)
  end

  def square
    return self if self.empty?
    self.map { |e| e**2 }
  end

  def square!
    return self if self.empty?
    self.map! { |e| e**2 }
  end
end
