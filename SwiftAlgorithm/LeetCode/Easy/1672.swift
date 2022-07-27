//
//  1672.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/27.
//

import Foundation

class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        var result: Int = 0
        accounts.map {
            let sum: Int = $0.reduce(0, +)
            result = max(result, sum)
        }
        
        return result
    }
}
