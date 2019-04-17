require_relative "binary_node"

class BinaryTree

  attr_reader :root, :sorted

  def initialize(values)
    # create a new tree and add all the values in the array
    # in this tree equal values go on the left branch (<=)    
    @root = nil
    @sorted = []
    values.each do |n|
      
      if @root == nil
        @root = BinaryNode.new(n)
      else
         add_leaf(n, @root)
      end

    end
  end

  def add_leaf(new_value, root)
    # recursively search the tree and add new value in appropriate spot

    if root == nil
      root = BinaryNode.new(new_value)
      return root
    end

    if new_value <= root.value
      root.left_child = add_leaf(new_value, root.left_child)
    elsif new_value > root.value
      root.right_child = add_leaf(new_value, root.right_child)
    end
    
    return root
  
  end

  def sort
    @sorted = []
    in_order_traversal(@root)
    return @sorted
  end

  private

   def in_order_traversal(root)
      if root != nil
        in_order_traversal(root.left_child)
        @sorted += [root.value]
        in_order_traversal(root.right_child)
      end
  end

  def is_min?(proposed)
    #return true if proposed <= current
    if @min_node == nil
      return true
    end

    if proposed.value <= @min_node.value
      return true
    else
      return false
    end
  end

end
  
