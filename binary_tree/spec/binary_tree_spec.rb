require 'spec_helper'

RSpec.describe BinaryTree, type: :model do
  describe "btree sort should work" do
    it "should order the array" do
      expected = [1,2,3,4,5, 6,7,8,9,10,14]
      array = [7,4,9,1,5, 3, 2, 6,14,10, 8]
      my_tree = BinaryTree.new(array)
      expect(my_tree.sort).to eq expected
    end
  end
end

