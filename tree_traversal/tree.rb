require_relative "node.rb"
require_relative "myqueue.rb"

def build_tree
  # The "Leafs" of a tree, elements that have no children
  deep_fifth_node = Node.new(5, [])
  eleventh_node = Node.new(11, [])
  fourth_node   = Node.new(4, [])

  # The "Branches" of the tree
  ninth_node = Node.new(9, [fourth_node])
  sixth_node = Node.new(6, [deep_fifth_node, eleventh_node])
  seventh_node = Node.new(7, [sixth_node])
  shallow_fifth_node = Node.new(5, [ninth_node])

  # The "Trunk" of the tree
  root = Node.new(2, [seventh_node, shallow_fifth_node])

  return root
end

def dp_find(list_of_payloads)
  root = build_tree
  list_of_payloads.each do |p|
    puts "Find #{p} By Depth Search"
    result = depth_first(root, p)
    if result == true
      puts
      puts "Payload #{p} found"
      puts
    else
      puts
      puts "Payload #{p} not found"
      puts
    end
  end
end

def bd_find(list_of_payloads)
  root = build_tree
  list_of_payloads.each do |p|
    puts "Find #{p} By Breadth Search"
    result = breadth_first(root, p)
    if result == true
      puts
      puts "Payload #{p} found"
      puts
    else
      puts
      puts "Payload #{p} not found"
      puts
    end
  end
end


def depth_first(root, payload_to_find)
# performs a depth first search and prints the payloads along the path
  print "#{root.payload} "
  if root.payload == payload_to_find
    return true
  end
    
  root.children.each do |child|
    if depth_first(child, payload_to_find) == true
      break
    end
  end

  return false

end

def breadth_first(root, payload_to_find)
# performs a breadth first search and prints the payloads along the path  
  queue = MyQueue.new
  queue.enqueue(root)

  until queue.is_empty? do
    current_node =  queue.dequeue 
    print "#{current_node.payload} "
    if current_node.payload == payload_to_find
      return true
    end
    current_node.children.each do |child|
      queue.enqueue(child)
    end
  end

  return false
end


#  run searches
puts "*********************************"
dp_find([11,6,5,9,4,19])
puts
puts "*********************************"
bd_find([11,6,5,9,4,19])
puts
