//
//  119.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/16.
//

import Foundation

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var result: [Int] = Array(repeating: 1, count: rowIndex+1)
        var tmp: [Int] = result
        
        for i in 0...rowIndex {
            for j in 0...(i/2) {
                if j == 0 || j == i {
                    continue
                } else {
                    tmp[j] = result[j] + result[j-1]
                    tmp[i-j] = tmp[j]
                }
            }
            
            result = tmp
        }
                
        return result
    }
}
