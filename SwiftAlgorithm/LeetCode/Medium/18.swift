//
//  18.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/04.
//

import Foundation

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else {
            return []
        }
        
        let n: Int = nums.count
        
        var nums = nums.sorted()
        var result: Set<[Int]> = []
        
        for i in 0..<n {
            for j in (i+1)..<n {
                var k: Int = j + 1
                var x: Int = n-1
                
                while k < x {
                    let sum: Int = nums[i] + nums[j] + nums[k] + nums[x]
                    
                    if sum == target {
                        result.insert([nums[i], nums[j], nums[k], nums[x]])
                        k += 1
                        x -= 1
                    } else if sum < target {
                        k += 1
                    } else if sum > target {
                        x -= 1
                    }
                }
            }
        }
        
        return Array(result)
    }
}
