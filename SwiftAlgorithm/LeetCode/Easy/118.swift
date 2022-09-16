//
//  118.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/16.
//

import Foundation

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result: [[Int]] = [[1]]
        if numRows == 1 { return result }

        for i in 2...numRows {
            var arr: [Int] = []
            for j in 0..<i {
                if j == 0 || j == i-1 {
                    arr.append(1)
                } else {
                    arr.append(result[i-2][j-1] + result[i-2][j])
                }
            }
            result.append(arr)
        }
        
        return result
    }
}
