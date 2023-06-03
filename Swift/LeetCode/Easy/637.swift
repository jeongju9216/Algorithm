//
//  637.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/01.
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
    var arr: [(count: Int, sum: Int)] = []
    
    func dfs(_ node: TreeNode, _ depth: Int) {
        if depth >= arr.count {
            arr.append((0, 0))
        }
        
        let sum: Int = arr[depth].sum + node.val
        let count: Int = arr[depth].count + 1
        
        arr[depth] = (count, sum)
        
        if let left = node.left {
            dfs(left, depth + 1)
        }
        
        if let right = node.right {
            dfs(right, depth + 1)
        }
    }
    
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        //결과 배열에 depth를 index로 써서 카운트와 합을 저장함
        //depth가 배열의 크기보다 크면 append
        guard let root = root else { return [0.0] }
        
        dfs(root, 0)
        
        var result: [Double] = []
        for item in arr {
            result.append(Double(item.sum) / Double(item.count))
        }
        
        return result
    }
}
