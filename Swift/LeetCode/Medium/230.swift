//
//  230.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/31.
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
    
    var count: Int = 0
    var value: Int = 0
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        dfs(root, k)
        
        return value
    }
    
    func dfs(_ node: TreeNode?, _ k: Int) {
        guard let node = node else { return }
        
        dfs(node.left, k)
        
        if count < k {
            count += 1
            value = node.val
            dfs(node.right, k)
        }
    }
}
