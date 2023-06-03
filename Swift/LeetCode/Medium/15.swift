//
//  15.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/14.
//

import Foundation

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        //정렬을 함
        //투포인터를 이용
        //sum이 0보다 작으면 left를 증가시킴
        //sum이 0보다 크면 right를 감소시킴
        var result: Set<[Int]> = []
        
        let nums = nums.sorted(by: <)
        let count = nums.count
        for i in 0..<(count-2) {
            var left = i+1
            var right = count - 1
            
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if sum == 0 {
                    result.insert([nums[i], nums[left], nums[right]])
                    left += 1
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else if sum > 0 {
                    right -= 1
                }
            }
        }
        
        return Array(result)
    }
}
