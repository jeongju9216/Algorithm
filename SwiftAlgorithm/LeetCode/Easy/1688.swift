//
//  1688.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/27.
//

import Foundation

class Solution {
    func numberOfMatches(_ n: Int) -> Int {
        var n = n
        var count: Int = 0
        while n > 1 {
            count += (n / 2)
            if n % 2 == 0 { //짝수
                n /= 2
            } else {
                n = n / 2 + 1
            }
        }
        
        return count
    }
}
