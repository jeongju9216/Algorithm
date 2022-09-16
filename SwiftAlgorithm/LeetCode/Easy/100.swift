//
//  100.swift
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
    var result: Bool = true
    
    func dfs(_ p: TreeNode?, _ q: TreeNode?) {
        //모두 nil이면 OK
        if p == nil && q == nil {
            return
        }
        
        //둘 중 하나만 nil이거나,
        //둘의 값이 다르면 X
        if p?.val != q?.val {
            result = false
            return
        }
        
        dfs(p?.left, q?.left) //left 체크
        dfs(p?.right, q?.right) //right 체크
    }
    
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        dfs(p, q)
        
        return result
    }
}
