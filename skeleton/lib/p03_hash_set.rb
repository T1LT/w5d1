class HashSet
  attr_reader :count
  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
      temp = num.hash % num_buckets
      @store[temp] << num
      @count += 1
      if count == num_buckets
        resize!
      end
    end
  end

  def remove(num)
    if self.include?(num)
      temp = num.hash % num_buckets
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
