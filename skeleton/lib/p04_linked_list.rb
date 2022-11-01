require 'byebug'
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @next = nil
    @prev = nil
  end

  def inspect
    { "key" => @key, "val" => @val }.inspect
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    i = @head
    while i.next != @tail
      i = i.next
    end
    i
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    i = @head.next
    while i != @tail
      if i.key == key
        return i.val
      end
      i = i.next
    end
    return nil
  end

  def include?(key)
  end

  def append(key, val)
    node = Node.new(key, val)
    if empty?
      @head.next = node
      @tail.prev = node
      node.next = @tail
      node.prev = @head
    else
      i = @head
      while i.next != @tail
        i = i.next
      end
      i.next = node
      @tail.prev = node
      node.next = @tail
      node.prev = i
    end
  end

  def update(key, val)
    if !empty?
      i = @head.next
      while i.key != key
        i = i.next
      end
      i.val = val
    end
  end

  def remove(key)
    
  end

  def each
    i = @head.next
    res = []
    while i != @tail
      yield i
      i = i.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
