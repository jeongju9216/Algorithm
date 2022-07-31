//
//  739.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/31.
//

import Foundation

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var days: [Int] = []
        
        for i in 0..<temperatures.count {
            var count: Int = 0
            for j in i..<temperatures.count {
                if temperatures[i] < temperatures[j] {
                    count = j - i
                    break
                }
            }
            days.append(count)
        }
        
        return days
    }
}
