# frozen_string_literal: true

require_relative './native_btree.rb'

# Ruby Usable BTree
class BTree
  attr_accessor :root_node
  include NativeBTree

  def find(node_value)
    Node.new(find_node(@root_node.to_ptr, node_value))
  end

  #TODO: COMPLETE THESE FUNCTIONS
  def destroy(node_value); end
  def to_a; end

  def <<(node_value)
    if !@root_node.nil?
      Node.new(insert_node(@root_node.to_ptr, node_value))
    else
      @root_node = Node.new
      @root_node[:value] = node_value
      @root_node
    end
  end
end
