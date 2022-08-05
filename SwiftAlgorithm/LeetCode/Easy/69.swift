//
//  69.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/04.
//

import Foundation

class Solution {
    func mySqrt(_ x: Int) -> Int {
        return Int(sqrt(Double(x)))
    }
}

//class Solution {
//    func mySqrt(_ x: Int) -> Int {
//        var left = 1
//        var right = x
//
//        while left < right {
//            let mid = (left + right) / 2
//
//            if mid * mid > x {
//                right = mid - 1
//            } else {
//                left = mid + 1
//            }
//        }
//
//        return left * left <= x ? left : left-1
//    }
//}
