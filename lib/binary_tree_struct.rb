class Node
  attr_accessor :value, :left, :right
  def initialize(val)
    self.value = val
  end

  def traverse(val, operation=:insert)
    eval_statement = operation == :search ? "return 'element does not exist'" : "self.%s = Node.new(%d)"
    if self.value == val
      return self
    elsif val < self.value && !self.left.nil?
      self.left.traverse(val, operation)
    elsif val > self.value && !self.right.nil?
      self.right.traverse(val, operation)
    elsif val < self.value && self.left.nil?
      eval(eval_statement % ['left', val])
    elsif val > self.value && self.right.nil?
      eval(eval_statement % ['right', val])
    end 
  end
end

class BinaryTreeStruct
  attr_accessor :root

  def initialize(val)
    self.root = Node.new(val)
  end

  def search(val)
    self.root.traverse(val, :search)
  end

  def insert(val)
    self.root.traverse(val)
  end
end

