//
//  454.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/04.
//

import Foundation

class Solution {
    func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
        let n: Int = nums1.count
        
        var sumDict: [Int: Int] = [:] //합 저장
        
        for i in 0..<n { //nums1
            for j in 0..<n { //nums2
                let sum: Int = nums1[i] + nums2[j]
                sumDict[sum, default: 0] += 1
            }
        }
        
        var result: Int = 0
        for i in 0..<n { //nums3
            for j in 0..<n { //nums4
                let sum: Int = (nums3[i] + nums4[j]) * -1
                
                if let count = sumDict[sum] {
                    result += count
                }
            }
        }
        
        return result
    }
}
