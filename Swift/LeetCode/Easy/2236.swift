//
//  2236.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/27.
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
    func checkTree(_ root: TreeNode?) -> Bool {
        return (root!.left!.val + root!.right!.val) == (root!.val)
    }
}
// Runtime: 6 ms, faster than 59.26% of Swift online submissions for Root Equals Sum of Children.
// Memory Usage: 13.8 MB, less than 91.11% of Swift online submissions for Root Equals Sum of Children.

