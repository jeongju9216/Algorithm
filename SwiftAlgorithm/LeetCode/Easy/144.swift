//
//  144.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/16.
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
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let node = root else { return [] }
        
        if node.left == nil && node.right == nil {
            return [node.val]
        }
        
        var result: [Int] = []
    
        result.append(node.val)
        let lefts: [Int] = preorderTraversal(node.left)
        result.append(contentsOf: lefts)
        let rights: [Int] = preorderTraversal(node.right)
        result.append(contentsOf: rights)
        
        return result
    }
}
