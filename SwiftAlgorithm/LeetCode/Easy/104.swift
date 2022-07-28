//
//  104.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/28.
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
    var maxDepth: Int = 0
 
    func maxDepth(_ root: TreeNode?) -> Int {
        dfs(root, depth: 1)
        return maxDepth
    }
    
    func dfs(_ node: TreeNode?, depth: Int) {
        guard let node = node else { return }
        
        if node.left == nil && node.right == nil {
            maxDepth = max(maxDepth, depth)
            return
        }
        
        dfs(node.left, depth: depth + 1)
        dfs(node.right, depth: depth + 1)
    }
}
