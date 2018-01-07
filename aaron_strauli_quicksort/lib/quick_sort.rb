class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array[0]
    left = []
    right = []
    for i in 1...array.length
      if array[i] < pivot
        left << array[i]
      else
        right << array[i]
      end
    end
    QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1
    partition_index = QuickSort.partition(array, 0, length, &prc)
    array[0..partition_index] = QuickSort.sort2!(array[0..partition_index], 0, array[0..partition_index].length, &prc)
    array[partition_index +1 ..-1] = QuickSort.sort2!(array[partition_index + 1..-1], partition_index + 1, array[partition_index + 1..-1].length, &prc)
    array
  end


  def self.partition(array, start, length, &prc)
    #default prc is for sorting in ascending order
    prc = prc ? prc : Proc.new { |el1, el2| el1 <=> el2 }
    partition_index = start
    pivot_value = array[start]
    for i in start + 1...(start + length)
      comparison = prc.call(array[i], pivot_value)
      if comparison == -1 && i > partition_index + 1
        array[partition_index + 1], array[i] = array[i], array[partition_index + 1]
        partition_index += 1
      elsif comparison == -1
        partition_index += 1
      end
    end
    array[start], array[partition_index] = array[partition_index], array[start]
    partition_index
  end
end
