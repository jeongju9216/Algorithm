//
//  1304.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/24.
//

import Foundation

class Solution {
    func sumZero(_ n: Int) -> [Int] {
        guard n > 1 else {
            return [0]
        }
        
        var arr: [Int] = Array(repeating: 0, count: n)
        
        var count: Int = 1
        for i in 0..<(n-1) {
            arr[i] = count
            count += 1
        }
        arr[n-1] = -(arr.reduce(0, +))
        
        return arr
    }
}
