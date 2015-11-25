def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(a)
  a.reduce(0) { |a,e| (e == []) ? a = 0 : a += e} 
end

def multiply(*a)
  a.reduce(:*)
end

def power(a, b)
  a**b
end

def factorial(n)
  if n == 0
    return 1
  else
    return n * factorial(n - 1)
  end
end
