require_relative "binary_tree.rb"

puts "Binary Tree Test"

arr = [7, 4, 9, 1, 6, 14, 10]
my_tree = BinaryTree.new(arr)

puts "Expected: #{arr.sort}"
puts "Result:   #{my_tree.sort}"

if my_tree.sort() == arr.sort
  puts "Passed"
else
  puts "Failed!"
end
