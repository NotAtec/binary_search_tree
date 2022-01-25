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
  end
end

t = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
