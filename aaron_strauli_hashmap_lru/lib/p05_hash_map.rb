require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    linked_list = bucket(key)
    linked_list.include?(key)
  end

  def set(key, val)
    if !include?(key)
      bucket(key).append(key, val)
      @count += 1
    else
      bucket(key).update(key, val)
    end
    resize! if num_buckets < @count
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    bucket(key).remove(key)
    @count -= 1
  end

  def each
    @store.each do |linked_list|
      linked_list.each do |node|
        yield [node.key, node.val]
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    old_store.each do |linked_list|
       linked_list.each do |node|
         set(node.key, node.val)
       end
     end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    num = key.hash
    @store[num % num_buckets]
  end
end
