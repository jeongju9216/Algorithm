//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/27.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    
    for i in (0..<arr1.count) {
        var temp: [Int] = []
        for j in (0..<arr1[i].count) {
            temp.append(arr1[i][j] + arr2[i][j])
        }
        result.append(temp)
    }
    
    return result
}

let arr1 = [[1],[2]]
let arr2 = [[3],[4]]
print(solution(arr1, arr2))
