//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/05.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    
    for index1 in 0..<arr1.count {
        var mul: [Int] = []
        for index2 in 0..<arr2[0].count {
            var sum: Int = 0
            for index3 in 0..<arr2.count {
                sum += (arr1[index1][index3] * arr2[index3][index2])
            }
            
            mul.append(sum)
        }
        result.append(mul)
    }
    
    return result
}

let arr1 = [[1, 2, 3], [4, 5, 6]]
let arr2 = [[1, 4], [2, 5], [3, 6]]
print(solution(arr1, arr2))
