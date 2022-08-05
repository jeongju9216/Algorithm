//
//  66.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/04.
//

import Foundation

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits: [Int] = digits.reversed()
        digits[0] += 1
        
        let len = digits.count
        for i in 0..<len {
            if digits[i] > 9 && i+1 < len {
                digits[i] = 0
                digits[i+1] += 1
            }
        }
        
        if digits[len-1] > 9 {
            digits[len-1] = 0
            digits.append(1)
        }
        
        return digits.reversed()
    }
}
