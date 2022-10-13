//
//  1561.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/13.
//

import Foundation

class Solution {
    func maxCoins(_ piles: [Int]) -> Int {
        //역순으로 정렬
        //앞에서 두 개, 뒤에서 한 개
        //8 7 4 2 2 1
        //8 7 1 / 4 2 2 => 9
        
        //9 8 7 6 5 4 3 2 1
        //9 8 1 -> 8
        //7 6 2 -> 6
        //5 4 3 -> 4 -> 18
        
        var piles: [Int] = piles.sorted { $0 > $1 }
        
        var result: Int = 0
        for i in 0..<(piles.count/3) {
            let coins: [Int] = [piles[i*2], piles[i*2+1], piles[piles.count-i-1]]
            result += coins[1]
        }
        
        return result
    }
}
