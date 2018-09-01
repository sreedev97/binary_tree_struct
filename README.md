# binary_tree_struct
Binary Tree Data Structure Implementation in ruby for faster traversing.

To install the gem : ``` gem install binary_tree_struct ```
or (using bundler) : ``` gem 'binary_tree_struct' ```

```
# Creating a new Binary Tree Structure
bst = BinaryTreeStruct.new(10) # Creates a new tree with value of root node as the argument passed in

# Appending values to the binary tree
bst.insert(12) # Traverses the tree and inserts the value at the appropriate position

# Searching the binary tree
bst.search(12) # Returns the node with value 12
```
