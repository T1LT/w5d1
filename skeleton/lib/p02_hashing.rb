class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    res = 0 
    (0...self.length).each do |i|
      res += (i * self[i])
    end
    res.hash
  end
end

class String
  def hash
    res = 0
    (0...self.length).each do |i|
      index = self[i].ord
      res += (i * index)
    end
    res.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.sort.to_s.hash
  end
end
