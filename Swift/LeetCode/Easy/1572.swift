//
//  1572.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/11/01.
//

import Foundation

class Solution {
    func diagonalSum(_ mat: [[Int]]) -> Int {
        var sum: Int = 0
        
        for i in 0..<mat.count {
            for j in 0..<mat[i].count {
                if i == j || i == (mat[i].count - j - 1) {
                    sum += mat[i][j]
                }
            }
        }
        
        return sum
    }
}
