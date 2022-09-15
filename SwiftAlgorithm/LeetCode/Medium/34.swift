//
//  34.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/15.
//

import Foundation

class Solution {
    func lowerBound(_ arr: [Int], _ left: Int, _ right: Int, _ target: Int) -> Int {
        var left = left
        var right = right
        var firstIndex: Int = -1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if arr[mid] == target {
                firstIndex = mid
                right = mid - 1
            } else if arr[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return firstIndex
    }

    func upperBound(_ arr: [Int], _ left: Int, _ right: Int, _ target: Int) -> Int {
        var left = left
        var right = right
        var lastIndex: Int = -1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            if arr[mid] == target {
                lastIndex = mid
                left = mid + 1
            } else if arr[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return lastIndex
    }
    
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else { return [-1, -1] }
        
        //lowerBound : target 이상인 값이 있는 가장 첫 번째 index
        let start = lowerBound(nums, 0, nums.count-1, target)
        //upperBound : target 초과인 값이 있는 가장 첫 번째 index
        var end = upperBound(nums, max(start, 0), nums.count-1, target)
        print("start: \(start) / end: \(end)")
        
        return [start, end]
    }
}
