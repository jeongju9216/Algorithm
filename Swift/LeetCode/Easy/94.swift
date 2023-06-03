//
//  94.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/30.
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
    
    var result: [Int] = []
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        dfs(root)
        
        return result
    }
    
    func dfs(_ node: TreeNode?) {
        guard let node = node else { return }
        
        dfs(node.left)
        result.append(node.val)
        dfs(node.right)
    }
}

