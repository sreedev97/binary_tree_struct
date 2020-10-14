# frozen_string_literal: true

require 'ffi'

APP_ROOT = File.dirname(__FILE__)

# Tree Module Importing All Functionality Via FFI
module NativeBTree
  extend FFI::Library
  # ffi_lib File.join(APP_ROOT, 'lib', 'btree.so')
  PLATFORM_FOREIGN_LIBRARIES = {
    /linux/i => 'btree.so',
    /mswin|windows|mingw/i => 'btree.dll',
    /.*/i => 'btree.dylib'
  }.freeze

  BTREE_DYNAMIC_LIB = PLATFORM_FOREIGN_LIBRARIES.find do |pattern, _libfile|
    RUBY_PLATFORM.match(pattern)
  end.last

  ffi_lib File.join(APP_ROOT, BTREE_DYNAMIC_LIB)

  attach_function :find_node, %i[pointer int32], :pointer
  attach_function :insert_node, %i[pointer int32], :pointer

  # Individual Node Struct Ported to Ruby using FFI
  class Node < FFI::Struct
    layout :value, :int32,
           :right_node, :pointer,
           :left_node, :pointer,
           :parent_node, :pointer

    def value=(node_value)
      self[:value] = node_value
    end

    def left_node
      Node.new(self[:left_node])
    end

    def parent_node
      Node.new(self[:parent_node])
    end

    def right_node
      Node.new(self[:right_node])
    end

    def value
      self[:value]
    end
  end
end
