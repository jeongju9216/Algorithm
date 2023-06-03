//
//  771.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/27.
//

import Foundation

class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        var dict: [Character: Bool] = [:]
        for jewel in Set(jewels) {
            dict[jewel] = true
        }
        
        var count = 0
        for stone in stones {
            if dict[stone] != nil {
                count += 1
            }
        }
        
        return count
    }
}
