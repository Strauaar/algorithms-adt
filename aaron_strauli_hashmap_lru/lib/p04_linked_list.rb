class Node
  attr_accessor :key, :val, :next, :prev

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
    # p self.prev
    new_prev = self.prev
    new_next = self.next
    new_prev.next = new_next
    new_next.prev = new_prev
    self
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
    return nil if @head.next == @tail
    @head.next
  end

  def last
    return nil if @tail.prev == @head
    @tail.prev
  end

  def empty?
    first == nil
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    if empty?
      @head.next = new_node
      @tail.prev = new_node
      new_node.prev = @head
      new_node.next = @tail
    else
      new_node.prev = last
      last.next = new_node
      @tail.prev = new_node
      new_node.next = @tail
    end
    # p "new_node: #{new_node}"
    # p "new_node.next: #{new_node.next.key}"
    # p "new_node.prev: #{new_node.prev.key}"
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
      end
    end
  end

  def remove(key)
    self.each do |node|
      # p node.to_s
      if node.key == key
        # p "node_to_del: #{node.key}"
        # p "node_to_del.prev: #{node.prev.key}"
        # p "node_to_del.next: #{node.next.key}"
        node.prev.next = node.next
        node.next.prev = node.prev
      end
    end
  end

  def each
    node = @head.next
    until node.next == nil
      yield node
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
