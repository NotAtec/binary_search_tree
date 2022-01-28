# [Binary Search Tree Assignment](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/binary-search-trees)
An assignment project part of [The Odin Project](https://www.theodinproject.com/) where creation of binary search trees and handling of said tree was done.

## Functions created
A list of all created functions to work with the binary tree is given below


Method        | Function
------------- |-------------
#build_tree | Method that creates a balanced binary tree from an array of values
#insert(val) | Method that inserts a given value into an existing binary tree
#delete(val) | Method that deletes a given value from an existing binary tree
#find(val) | Finds a given value from an existing binary tree, and returns the found node.
#pretty_print | Creates a printable version of the tree, and outputs it to console
#level_order | Processes through the tree in level order, and accepts a block or returns an array if none given.
#preorder      | Processes through the tree in pre-order, and accepts a block or returns an array if none given.
#postorder      | Processes through the tree in post-order, and accepts a block or returns an array if none given.
#inorder | Processes through the tree in in-order, and accepts a block or returns an array if none given.
#height | Returns the BST Height of a given node.
#depth | Returns the BST Depth of a given node.
#balanced? | Returns true if a given tree is balanced (Which is the case when the left & right subtree of all nodes differ less than 1 in height)
#rebalance | Creates a new tree using all values of the old tree. This new root node is mapped to the root.
