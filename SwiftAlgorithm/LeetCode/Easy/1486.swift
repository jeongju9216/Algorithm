//
//  1486.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/09.
//

import Foundation

class Solution {
    func xorOperation(_ n: Int, _ start: Int) -> Int {
        let arr: [Int] = (0..<n).map { start + 2 * $0 }
        let result: Int = arr.reduce(0) { $0 ^ $1 }
        
        return result
    }
}
