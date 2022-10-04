//
//  938.swift
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
    
    var sum: Int = 0
    
    func dfs(_ node: TreeNode, _ low: Int, _ high: Int) {
        if node.val < low {
            if let right = node.right {
                dfs(right, low, high)
            }
        } else if node.val > high {
            if let left = node.left {
                dfs(left, low, high)
            }
        } else {
            sum += node.val
            
            if let left = node.left {
                dfs(left, low, high)
            }
            
            if let right = node.right {
                dfs(right, low, high)
            }
        }
    }
    
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else { return 0 }
        
        dfs(root, low, high)
        
        return sum
    }
}
