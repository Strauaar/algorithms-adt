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
    partition_index = QuickSort.partition(array, 0, array.length)
  end

  def self.partition(array, start, length, &prc)
    partition_index = start
    pivot_value = array[start]
    for i in start + 1...(start + length)
      if array[i] < pivot_value && i > partition_index + 1
        array[partition_index + 1], array[i] = array[i], array[partition_index + 1]
        partition_index += 1
      elsif array[i] < pivot_value
        partition_index += 1
      end
    end
    array[start], array[partition_index] = array[partition_index], array[start]
    partition_index
  end
end
