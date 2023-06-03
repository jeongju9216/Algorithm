//
//  2427.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/06.
//

import Foundation

class Solution {
    func commonFactors(_ a: Int, _ b: Int) -> Int {
        var count: Int = 1
        var result: Int = 0
        while count <= a && count <= b {
            if a % count == 0 && b % count == 0 {
                result += 1
            }
            count += 1
        }
        
        return result
    }
}
