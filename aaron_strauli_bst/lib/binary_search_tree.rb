# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'
class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value)
    else
      node = @root
      until node.nil?
        current_position = nil
        if value <= node.value
          node.left.nil? ? node.left = BSTNode.new(value) : current_position = node.left
        else
          node.right.nil? ? node.right = BSTNode.new(value) : current_position = node.right
        end
        node = current_position
      end
    end
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if value == tree_node.value
    return find(value, tree_node.left) if value < tree_node.value
    return find(value, tree_node.right) if value > tree_node.value
  end

  def maximum(tree_node = @root)
    node = tree_node
    while node.right
      node = node.right
    end
    node
  end

  def delete(value)
    node = find(value)
    return nil if node.nil?
    if node.left == nil && node.right == nil
      if node == @root
        @root = nil
        return nil
      end
      node.parent.remove_child(value)
    elsif (node.right == nil && node.left != nil) || (node.right != nil && node.left == nil)
      child = node.right == nil ? node.left : node.right
      node.parent.replace_child(value, child)
    else
      replacement = maximum(node.left)
      replacement.parent.replace_child(replacement.value, replacement.left)
      replacement.left = node.left
      replacement.right = node.right
      node.parent.replace_child(value, replacement)
    end
  end


  def depth

  end

  def is_balanced?(tree_node = @root)

  end

  def in_order_traversal(tree_node = @root, arr = [])
    if tree_node
      traverse_left = in_order_traversal(tree_node.left, arr)
      arr << tree_node.value
      traverse_right = in_order_traversal(tree_node.right, arr)
    end
    arr
  end


  private
  # optional helper methods go here:


end
