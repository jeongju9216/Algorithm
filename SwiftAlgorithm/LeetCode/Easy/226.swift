//
//  226.swift
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return root }
        
        dfs(root)
        
        return root
    }
    
    func dfs(_ node: TreeNode?) {
        if node == nil { return }
        
        let temp: TreeNode? = node?.left
        node?.left = node?.right
        node?.right = temp
        
        dfs(node?.left)
        dfs(node?.right)
    }
}
