def measure count = 1
  total_time = 0
  count.times do
    before = Time.now
    yield
    after = Time.now
    total_time += after - before
  end
  total_time / count
end
