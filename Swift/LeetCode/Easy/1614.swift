//
//  1614.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/22.
//

import Foundation

class Solution {
    func maxDepth(_ s: String) -> Int {
        let arr: [Character] = Array(s)
        var result: Int = 0
        var openCount: Int = 0

        for char in arr {
            if char == "(" {
                openCount += 1
            } else if char == ")" {
                result = max(result, openCount)
                openCount -= 1
            }
        }

        return result
    }
}
