//
//  1431.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/27.
//

import Foundation

class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        var max: Int = candies.max()!
        
        return candies.map { $0 + extraCandies >= max }
    }
}
