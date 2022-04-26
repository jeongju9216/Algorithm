//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/26.
//

import Foundation

class Tree {
    var value: Int
    var x: Int
    var y: Int
    var leftChild: Tree?
    var rightChild: Tree?
    var parent: Tree?
    var description: String {
        "x: \(x) / y: \(y)"
    }
    
    init(x: Int, y: Int, value: Int) {
        self.x = x
        self.y = y
        self.value = value
    }
    
    func addChild(_ node: Tree) {
        if node.x < self.x {
            if leftChild != nil {
                leftChild?.addChild(node)
            } else {
                leftChild = Tree(x: node.x, y: node.y, value: node.value)
                leftChild?.parent = self
            }
        } else {
            if rightChild != nil {
                rightChild?.addChild(node)
            } else {
                rightChild = Tree(x: node.x, y: node.y, value: node.value)
                rightChild?.parent = self
            }
        }
    }
}

func preOrder(_ tree: Tree) -> [Int] {
    var values: [Int] = []
    
    values.append(tree.value)
    if let leftChild = tree.leftChild {
        let leftOrder = preOrder(leftChild)
        values.append(contentsOf: leftOrder)
    }
    
    if let rightChild = tree.rightChild {
        let rightOrder = preOrder(rightChild)
        values.append(contentsOf: rightOrder)
    }
    
    return values
}

func postOrder(_ tree: Tree) -> [Int] {
    var values: [Int] = []
    
    if let leftChild = tree.leftChild {
        let leftOrder = postOrder(leftChild)
        values.append(contentsOf: leftOrder)
    }
    
    if let rightChild = tree.rightChild {
        let rightOrder = postOrder(rightChild)
        values.append(contentsOf: rightOrder)
    }
    values.append(tree.value)

    return values
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    var nodes: [Tree] = []
    for node in nodeinfo {
        let treeNode = Tree(x: node[0], y: node[1], value: nodes.count+1)
        nodes.append(treeNode)
    }
    nodes.sort { $0.y > $1.y }
    
    let tree: Tree = nodes.first!
    for i in 1..<nodes.count {
        let node = nodes[i]
        tree.addChild(node)
    }
    
    let pre = preOrder(tree)
    print("pre: \(pre)")
    
    let post = postOrder(tree)
    print("post: \(post)")
    
    return [pre, post]
}
