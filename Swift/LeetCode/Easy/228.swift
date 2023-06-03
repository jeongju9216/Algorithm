//
//  228.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/17.
//

import Foundation

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard !nums.isEmpty else { return [] }
        
        var result: [String] = []
        var start: Int = nums[0]
        var end: Int = nums[0]
        for i in 0..<nums.count {
            if nums[i] - end > 1 { //연속적이지 않은 경우
                if start == end {
                   result.append("\(start)")
                } else {
                    result.append("\(start)->\(end)")
                }
                
                start = nums[i]
            }
            
            end = nums[i]
        }
        
        if start == end {
           result.append("\(start)")
        } else {
            result.append("\(start)->\(end)")
        }
        
        return result
    }
}
