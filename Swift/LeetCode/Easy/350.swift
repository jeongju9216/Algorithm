//
//  350.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/10.
//

import Foundation

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var visited: [Bool] = Array(repeating: false, count: nums2.count)
        
        var result: [Int] = []
        for i in 0..<nums1.count {
            for j in 0..<nums2.count {
                if nums1[i] == nums2[j] && !visited[j] {
                    visited[j] = true
                    result.append(nums1[i])
                    break
                }
            }
        }
        
        return result
    }
}
