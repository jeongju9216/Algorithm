//
//  122.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/02.
//

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        //그때그때 파는 것
        //가장 낮을 때에서 가장 높을 때 파는 것
        var dp: [Int] = [0]
        var sum: Int = 0, minCost: Int = prices[0]
        var cost: Int = prices[0]
        for i in 1..<prices.count {
            minCost = min(minCost, prices[i])
            
            if cost < prices[i] {
                dp.append(max(dp.last! + prices[i] - cost, prices[i] - minCost))
            }
            
            cost = prices[i]
        }
        
        return dp.last!
    }
}
