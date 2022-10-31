class MaxIntSet

  attr_reader :store 

  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    if !is_valid?(num)
      raise "Out of bounds"
    else
      @store[num] = true
    end
  end

  def remove(num)
    if !is_valid?(num)
      raise "Out of bounds"
    else
      @store[num] = false
    end
  end

  def include?(num)
    if !is_valid?(num)
      raise "Out of bounds"
    else
      @store[num] == true
    end
  end

  private

  def is_valid?(num)
    if num > @store.length || num < 0
      return false 
    end
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    # check if num already included
    if !self.include?(num)
      temp = num % num_buckets
      @store[temp] << num
    end
  end

  def remove(num)
    if self.include?(num)
      temp = num % num_buckets
      @store[temp] -= [num]
    else
      raise 'num is not in the store!'
    end
  end

  def include?(num)
    @store.each do |bucket|
      return true if bucket.include?(num)
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
      temp = num % num_buckets
      @store[temp] << num
      @count += 1
      if count == num_buckets
        resize!
      end
    end
  end

  def remove(num)
    if self.include?(num)
      temp = num % num_buckets
      @store[temp] -= [num]
      @count -= 1
    end
  end

  def include?(num)
    @store.each do |bucket|
      return true if bucket.include?(num)
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store.dup
    @store = Array.new(num_buckets * 2) { Array.new }
    temp.flatten.each do |num|
      new_num = num % (num_buckets * 2)
      @store[new_num] << num
    end
  end
end
