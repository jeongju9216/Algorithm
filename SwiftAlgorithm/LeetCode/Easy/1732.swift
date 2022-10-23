//
//  1732.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/23.
//

import Foundation

class Solution {
    func largestAltitude(_ gain: [Int]) -> Int {
        var result: [Int] = [0]
        for i in 0..<gain.count {
            result.append(result[i] + gain[i])
        }
                
        return result.max()!
    }
}
