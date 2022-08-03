//
//  543.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/03.
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
    var result: Int = 0
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        dfs(root)
        
        return result
    }
    
    func dfs(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        
        let leftDepth = dfs(node.left)
        let rightDepth = dfs(node.right)
        // print("node: \(node.val) / \(leftDepth) / \(rightDepth)")
        result = max(result, leftDepth + rightDepth)
        return max(leftDepth, rightDepth) + 1
    }
}
