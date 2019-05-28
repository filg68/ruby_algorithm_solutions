class LinkedListNode
  # creates a node
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(55, node3)
node5 = LinkedListNode.new(11, node4)
node6 = LinkedListNode.new(92, node5)

class Stack
  attr_reader :data
  # attr_writer :data

  def initialize
    @data = LinkedListNode.new(nil)
  end

  # Push a value onto the stack
  def push(value)
    # IMPLEMENT ME!
    node = LinkedListNode.new(value, data)
    @data = node
  end

  # Pop an item off the stack.
  # Remove the last item that was pushed onto the
  # stack and return the value to the user
  def pop
    # I RETURN A VALUE
    if data.value != nil
      top_item = data.value
      @data = data.next_node
    else
      top_item = nil
      puts "End of the line."
    end
    return top_item
  end

end

def reverse_list(list)
  # ADD CODE HERE
  reverse_stack = Stack.new

  while list
    # ADD CODE HERE
    reverse_stack.push(list)
    list = list.next_node
  end

  node = reverse_stack.pop
  while node != nil
    print "#{node.value} --> "
    node = reverse_stack.pop
  end
end

def reverse_list_in_place(list, previous=nil)
  if list
    next_node = list.next_node
    list.next_node = previous
    reverse_list_in_place(next_node, list)
  else
    return previous
  end
end

def cycle_check(tortoise)
  hare = tortoise
  while hare != nil
    if tortoise != nil
      tortoise = tortoise.next_node
    end

    if hare.next_node !=nil
      hare = hare.next_node.next_node
    end

    if hare == nil || tortoise == nil
      puts "There is no cycle"
      break
    end

    if tortoise == hare
      puts "Found a cycle starting at #{tortoise.value}"
      start_pos = hare
      hare = hare.next_node

      steps = 1
      while hare != start_pos
        steps += 1
        last_pos = hare
        hare = hare.next_node
      end
      puts "The cycle is #{steps} numbers long and loops at #{last_pos.value}.\n\r"
      break
    end
  end
  
end

# Creates a new Stack object
# stack = Stack.new
# stack.push(1)
# stack.push(2)
# puts stack.pop
# puts stack.pop

# Tries to pop the TOP number from the stack,
# but it is empty so it returns nil (or End of the line, cause that's what I did)
# puts stack.pop
# puts stack.pop

# Print the original list of number
print_values(node6)
# Use a stack to reverse the list
reverse_list(node6)
# Reverse the list in place
reversed_list = reverse_list_in_place(node6,nil)
print_values(reversed_list)

# check for a cycle
cycle_check(reversed_list)   # Will return There is No Cycle.

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(55, node3)
node5 = LinkedListNode.new(11, node4)
node6 = LinkedListNode.new(92, node5)
node1.next_node = node6

cycle_check(node6)   # Should find a cycle 6 numbers long

node1.next_node = node3

cycle_check(node6)   # Should find a cycle 3 numbers long

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(55, node3)
node5 = LinkedListNode.new(11, node4)
node6 = LinkedListNode.new(92, node5)
node4.next_node = node6

cycle_check(node6)   # Should find a cycle 3 numbers long


