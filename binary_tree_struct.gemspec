# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name                     = 'binary_tree_struct'
  s.version                  = '2.0'
  spec.required_ruby_version = '>= 2.4.0'
  s.date                     = '2018-10-01'
  s.summary                  = 'Implementation of Binary Tree Data Structure in Ruby.'
  s.description              = "Provides faster traversal than Ruby's Built in Array Linear Search"
  s.authors                  = ['Sreedev Kodichath']
  s.email                    = 'sreedevpadmakumar@gmail.com'
  s.files                    = ['lib/btree.rb', 'lib/native_btree.rb', 'lib/btree.so']
  s.homepage                 = 'http://rubygems.org/gems/binary-tree-struct'
  s.license                  = 'MIT'
  s.add_runtime_dependency 'ffi', '>=1.13.1'
end
