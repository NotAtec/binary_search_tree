# frozen_string_literal: true
require 'pry-byebug'
# Contains value & children
class Node
  attr_accessor :data, :left, :right
  def initialize(d, l = nil, r = nil)
    @data = d
    @left = l
    @right = r
  end
end

# Contains root of tree & way of traversing it
class Tree
  include Comparable
  attr_accessor :root
  def initialize(arr)
    @root = build_tree(arr)
  end

  def build_tree(arr)
    arr = arr.uniq.sort
    root = Node.new(arr.shift)
    place_in_tree = root
    arr.each do |val|
      n = Node.new(val)
      until place_in_tree.left.nil? || place_in_tree.right.nil? do
        val < place_in_tree.data ? place_in_tree = place_in_tree.left : place_in_tree = place_in_tree.right
      end
      val < place_in_tree.data ? place_in_tree.left = n : place_in_tree.right = n
    end
    root
  end
end

t = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
