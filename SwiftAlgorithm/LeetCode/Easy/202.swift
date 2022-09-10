//
//  202.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/09.
//

import Foundation

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var cache: [Int: Bool] = [:]
        var cal: Int = n
        
        while cal != 1 {
            if let _ = cache[cal] {
                return false
            }
            cache[cal] = true

            let splitNum = Array(String(cal))
            var sum: Int = 0
            for num in splitNum {
                sum += Int(pow(Double(String(num))!, 2))
            }
            
            cal = sum
        }
        
        return true
    }
}
