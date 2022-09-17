//
//  231.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/17.
//

import Foundation

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        var powerNum: Int = 1
        var index: Int = 0
        while powerNum < n {
            powerNum = 2 << index
            index += 1
        }
        
        return (powerNum == n)
    }
}
