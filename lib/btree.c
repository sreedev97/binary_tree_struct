#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

struct btree_node {
  uint32_t value;
  struct btree_node *left_node, *right_node, *parent_node;
};

typedef struct btree_node btree_node_t;

void set_node_val(btree_node_t *node, uint32_t value) {
  *node = (btree_node_t) { .value = value };
}

btree_node_t *find_node(btree_node_t *rootnode, uint32_t value) {
  if(rootnode && rootnode->value) {
    if(rootnode->value == value || (!(rootnode->right_node) && !(rootnode->left_node))) {
      return rootnode;
    } else {
      if(value > rootnode->value){
        return find_node(rootnode->right_node, value);
      } else {
        return find_node(rootnode->left_node, value);
      }
    }
  } else {
    return rootnode;
  }
}

btree_node_t *insert_node(btree_node_t *rootnode, uint32_t value) {
  if(value == rootnode->value) {
    return rootnode;
  } 
  else if (value > rootnode->value) {
    if(rootnode->right_node) {
      return insert_node(rootnode->right_node, value);
    }
    else {
      rootnode->right_node = (btree_node_t *) malloc(sizeof(btree_node_t));
      rootnode->right_node->value = value;
      rootnode->right_node->parent_node = rootnode;
      return rootnode->right_node;
    }
  }
  else if (value < rootnode->value) {
    if(rootnode->left_node) {
      return insert_node(rootnode->left_node, value);
    }
    else {
      rootnode->left_node = (btree_node_t *) malloc(sizeof(btree_node_t));
      rootnode->left_node->value = value;
      rootnode->left_node->parent_node = rootnode;
      return rootnode->left_node;
    }
  }
  else {
    return rootnode;
  }
}
