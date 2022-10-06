//
//  2265.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/07.
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
    
    func dfs(_ node: TreeNode) -> (sum: Int, count: Int) {
        if node.left == nil && node.right == nil {
            result += 1
            return (node.val, 1)
        }
        
        var count: Int = 0
        var sum: Int = 0
        if let left = node.left {
            let sub = dfs(left)
            count += sub.count
            sum += sub.sum
        }
        
        if let right = node.right {
            let sub = dfs(right)
            count += sub.count
            sum += sub.sum
        }
                
        sum += node.val
        count += 1
        
        if sum / count == node.val {
            result += 1
        }
        
        return (sum, count)
    }
    
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        //depth가 깊은거부터 체크
        //leaf 노드는 무조건 됨
        //left -> right -> center
        //left + right == center => counting
        
        dfs(root)
        
        return result
    }
}
