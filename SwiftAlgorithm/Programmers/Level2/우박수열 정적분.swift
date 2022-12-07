//
//  우박수열 정적분.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/07.
//

import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    
    var nums: [Int] = [k]
    var k = k
    while k > 1 {
        if k % 2 == 0 {
            k /= 2
        } else {
            k = k * 3 + 1
        }
        
        nums.append(k)
    }
    
    //(윗변 + 아랫변) * 높이 / 2
    var areas: [Double] = [0]
    var sum: Double = 0
    for i in 1..<nums.count {
        let area = Double(nums[i] + nums[i-1]) / 2.0
        sum += area
        areas.append(sum)
    }
    
    var result: [Double] = []
    for range in ranges {
        if range[0] == 0 && range[1] == 0 {
            result.append(areas.last!)
            
            continue
        }
        
        let start = range[0]
        let end = nums.count + range[1] - 1
                
        if start > end {
            result.append(-1)
        } else {
            result.append(areas[end] - areas[start])
        }
    }
    
    return result
}
