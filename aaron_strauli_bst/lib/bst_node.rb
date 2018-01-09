class BSTNode
  attr_reader :value
  attr_accessor :left, :right, :parent
  def initialize(value)
    @value = value
  end

  def left=(left_node)
    left_node.parent = self
    @left = left_node
  end

  def right=(right_node)
    right_node.parent = self
    @right = right_node
  end

  def remove_child(value)
   if value == @left.value
     @left = nil
   elsif value == @right.value
     @right = nil
   else
     return nil
   end
  end

  def replace_child(child_value, node)
    if child_value == @left.value
      @left = node
    elsif child_value == @right.value
      @right = node
    end
  end

end
