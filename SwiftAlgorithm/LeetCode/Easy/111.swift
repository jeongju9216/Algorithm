//
//  111.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/30.
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
    var depth: Int = Int.max
    
    func dfs(_ node: TreeNode, _ current: Int) {
        if node.left == nil && node.right == nil {
            depth = min(depth, current)
            return
        }
        
        if let left = node.left {
            dfs(left, current + 1)
        }
        
        if let right = node.right {
            dfs(right, current + 1)
        }
    }
    
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        dfs(root, 1)
        
        return depth
    }
}
