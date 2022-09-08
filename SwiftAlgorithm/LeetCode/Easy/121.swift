//
//  121.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/08.
//

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var result: Int = 0
        var buy: Int = prices[0]
        for i in 1..<prices.count {
            let profit: Int = prices[i] - buy
            if profit < 0 {
                buy = prices[i]
            } else {
                result = max(result, profit)
            }
        }
        
        return result
    }
}
