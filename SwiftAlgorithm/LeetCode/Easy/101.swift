//
//  101.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/02.
//

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isSymmetricTree(root, root)
    }
    
    func isSymmetricTree(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        if node1 == nil && node2 == nil {
            return true
        }
        
        guard let node1 = node1, let node2 = node2 else { return false }
        
        return node1.val == node2.val &&
                isSymmetricTree(node1.left, node2.right) &&
                isSymmetricTree(node1.right, node2.left)
    }
}
