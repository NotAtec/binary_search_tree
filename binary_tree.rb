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
    return Node.new(arr[0]) if arr.length <= 1

    middle = Node.new(arr[(arr.length / 2).floor])

    left = build_tree(arr[0..(arr.length / 2).floor - 1])
    right = build_tree(arr[(arr.length / 2).floor + 1..-1])

    middle.left = left
    middle.right = right
    middle
  end

  def insert(val)
    position = @root
    loop do
      if val < position.data
        if position.left == nil
          position.left = Node.new(val)
          return val
        end

        position = position.left
      else
        if position.right == nil
          position.right = Node.new(val)
          return val
        end

        position = position.right
      end
    end
  end

  def find(val)
    position = @root
    loop do
      return position if val == position.data
      return nil if position.data.nil?

      position = val < position.data ? position.left : position.right
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

t = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
t.pretty_print
p t.find(8)
p t.find(324)