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
    return Node.new(arr[0]) if arr.length == 1
    return nil if arr.length < 1

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
        if position.left.nil?
          position.left = Node.new(val)
          return val
        end

        position = position.left
      else
        if position.right.nil?
          position.right = Node.new(val)
          return val
        end

        position = position.right
      end
    end
  end

  def delete(val)
    position = @root
    higher = nil
    left_or_right = nil

    loop do
      return p "#{val} Doesn't exist in tree" if position.nil?

      if val == position.data
        return no_children(higher, left_or_right) if position.left.nil? && position.right.nil?
        return one_child(higher, left_or_right, position) if one_child?(position)
        return two_children(position) if !position.left.nil? && !position.right.nil?
      end

      higher = position
      left_or_right = val < position.data
      position = val < position.data ? position.left : position.right
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

  def level_order
    queue = [@root]
    order = []
    until queue.length.zero?
      current = queue.shift
      queue << current.left unless current.left.nil?
      queue << current.right unless current.right.nil?
      block_given? ? yield(current) : order << current
    end
    order unless block_given?
  end

  def preorder
    stack = [@root]
    order = []
    until stack.length.zero?
      current = stack.pop
      stack << current.right unless current.right.nil?
      stack << current.left unless current.left.nil?
      block_given? ? yield(current) : order << current
    end
    order unless block_given?
  end

  def postorder
    p stack = postorder_stack
  end
  private

  def no_children(higher, left_or_right)
    @root = nil if higher.nil?
    left_or_right ? higher.left = nil : higher.right = nil
  end

  def one_child(higher, left_or_right, position)
    paste = position.left.nil? ? position.right : position.left
    @root = paste if higher.nil?
    left_or_right ? higher.left = paste : higher.right = paste
  end

  def one_child?(position)
    position.left.nil? && !position.right.nil? || !position.left.nil? && position.right.nil?
  end

  def two_children(position)
    position.data = get_minimum(position)
  end

  def get_minimum(pos)
    higher = pos
    pos = pos.right
    until pos.left.nil?
      higher = pos
      pos = pos.left
    end
    pos == higher.right ? delete(higher.right.data) : higher.left = nil
    pos.data
  end

  def postorder_stack
    reader = [@root]
    stack = []
    until reader.length.zero?
      current = reader.pop
      stack << current
      stack << current.left unless current.left.nil?
      stack << current.right unless current.right.nil?
      reader << current.left unless current.left.nil?
      reader << current.right unless current.right.nil?
    end
    stack.reverse
  end
end
