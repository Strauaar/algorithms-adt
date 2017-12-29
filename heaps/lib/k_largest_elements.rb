require_relative 'heap'

def k_largest_elements(array, k)
  prc = Proc.new {|el1, el2| el2 <=> el1}
  for i in 1...array.length
    BinaryMinHeap.heapify_up(array, i, array.length, &prc)
  end
  (array.length - 1).downto(0) do |i|
    array[0], array[i] = array[i], array[0]
    BinaryMinHeap.heapify_down(array, 0, i, &prc)
  end
  array[-k..-1]
end
