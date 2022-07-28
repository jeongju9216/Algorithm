//
//  1302.swift
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
    
    var sum: Int = 0
    var maxDepth: Int = 0
    
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        dfs(root, depth: 0)
        return sum
    }
    
    func dfs(_ node: TreeNode?, depth: Int) {
        guard let node = node else { return }
        
        if maxDepth == depth {
            sum += node.val
        } else if maxDepth < depth {
            maxDepth = depth
            sum = node.val
        }
        
        dfs(node.left, depth: depth + 1)
        dfs(node.right, depth: depth + 1)
    }
}
// Runtime: 310 ms, faster than 84.38% of Swift online submissions for Deepest Leaves Sum.
// Memory Usage: 15.1 MB, less than 54.17% of Swift online submissions for Deepest Leaves Sum.

