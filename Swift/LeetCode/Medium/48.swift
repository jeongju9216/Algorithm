//
//  48.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/31.
//

import Foundation

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let len = matrix.count

        for i in 0..<len {
            matrix[i] = matrix[i].reversed()
        }
        
        for i in 0..<len {
            for j in i..<len {
                let temp = matrix[i][len-j-1]
                matrix[i][len-j-1] = matrix[j][len-i-1]
                matrix[j][len-i-1] = temp
            }
        }
    }
}
