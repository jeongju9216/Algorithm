//
//  326.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/09.
//

import Foundation

class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        let maximumPowerOf3 = Int(pow(3, floor(log10(Double(Int32.max))/log10(3))))
        return n > 0 && n <= Int.max && maximumPowerOf3 % n == 0
    }

//    func isPowerOfThree(_ n: Int) -> Bool {
//
//        guard n > 0 else { return false }
//
//        var powNum: Int = 0
//        var count = 0.0
//        while powNum < n {
//            powNum = Int(pow(3.0, count))
//            count += 1
//        }
//
//        return (powNum == n)
//    }
}
