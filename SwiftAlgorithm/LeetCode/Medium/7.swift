//
//  7.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/02.
//

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        let newX: Int = Int(abs(x))
        let arr: [Character] = Array(String(newX))
        
        var result: Int64 = Int64(String(arr.reversed()))!
        if x < 0 {
            result = -result
        }
        
        if result < Int(Int32.max) - 1 && result > Int(Int32.min) {
            return Int(result)
        } else {
            return 0
        }
    }
}
