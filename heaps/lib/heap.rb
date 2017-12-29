class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    prc = prc ? prc : Proc.new {|el1, el2| el1 <=> el2}
    @store = []
    #default is for min heap
    @prc = prc
  end

  def count
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    last_el = @store.pop
    BinaryMinHeap.heapify_down(@store, 0)
    last_el
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    BinaryMinHeap.heapify_up(@store, @store.length - 1)
  end

  public
  def self.child_indices(len, parent_index)
    res = []
    if parent_index*2 + 1 <= (len - 1)
      res << parent_index * 2 + 1
    end
    if parent_index*2 + 2 <= (len - 1)
      res << parent_index*2 + 2
    end
    res
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    return if BinaryMinHeap.child_indices(len, parent_idx).length == 0
    prc = prc ? prc : Proc.new {|el1, el2| el1 <=> el2}
    child_indices = BinaryMinHeap.child_indices(len, parent_idx)
    child_indices.each do |idx|
      #if chlid value is less than parent value then switch
      if (prc.call(array[idx], array[parent_idx])) == -1
        array[idx], array[parent_idx] = array[parent_idx], array[idx]
      end
    end
    BinaryMinHeap.heapify_down(array[parent_idx + 1..-1], 0, array[parent_idx + 1..-1].length, &prc)
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return if child_idx == 0
    prc = prc ? prc : Proc.new {|el1, el2| el1 <=> el2}
    parent_idx = BinaryMinHeap.parent_index(child_idx)
    if prc.call(array[child_idx], array[parent_idx]) == -1
      array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
    end
    BinaryMinHeap.heapify_up(array, child_idx - 1, array.length, &prc)
    array
  end
end
