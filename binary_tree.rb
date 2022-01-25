# frozen_string_literal: true

# Contains value & children
class Node
  def initialize(d, l = nil, r = nil)
    @data = d
    @left = l
    @right = r
  end
end

# Contains root of tree & way of traversing it
class Tree
  def initialize(arr)
    @root = build_tree(arr)
  end
end