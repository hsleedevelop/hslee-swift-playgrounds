//: [Previous](@previous)

import Foundation

indirect enum BinaryTree2 {
    case empty
    case node(_ left: BinaryTree, _ data: Int, _ right: BinaryTree)
}

class BinaryTree {
    var node: (BinaryTree?, Int, BinaryTree?)!
}

var tree = BinaryTree()
tree.node = (nil, 4, nil)
tree.node.0 = (nil, 2, nil)

print(tree)

//var tree: BinaryTree = .node(.empty, 4, .empty)
