# frozen_string_literal: true
require 'pry-byebug'
# Contains value & children
class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(d, l = nil, r = nil)
    @data = d
    @left = l
    @right = r
  end
end

# Contains root of tree & way of traversing it
class Tree
  attr_accessor :root

  def initialize(arr)
    @root = build_tree(arr.uniq.sort)
  end

  def build_tree(arr)
    return Node.new(arr) if arr.length <= 1

    middle = Node.new(arr[(arr.length / 2).floor])

    left = build_tree(arr[0..(arr.length / 2).floor - 1])
    right = build_tree(arr[(arr.length / 2).floor + 1..-1])

    middle.left = left
    middle.right = right
    middle
  end

end



t = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
