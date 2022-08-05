//
//  112.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/05.
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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        let result = dfs(root, 0, targetSum)
        
        return result
    }
    
    func dfs(_ node: TreeNode?, _ sum: Int, _ targetSum: Int) -> Bool {
        guard let node = node else { return false }
        
        var sum = sum + node.val
        
        //leaf
        if node.left == nil && node.right == nil {
            if sum == targetSum {
                return true
            }
        }
        
        return dfs(node.left, sum, targetSum) || dfs(node.right, sum, targetSum)
    }
}
