//
//  9663.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/09.
//

import Foundation

func dfs(_ row: Int) {
    if row == n {
        result += 1
        return
    }
    
    for col in 0..<n {
        let d1 = row + col
        let d2 = row - col + n - 1
        
        if !(cols[col] || diagonal1[d1] || diagonal2[d2]) {
            cols[col] = true
            diagonal1[d1] = true
            diagonal2[d2] = true
            
            dfs(row+1)
            
            cols[col] = false
            diagonal1[d1] = false
            diagonal2[d2] = false
        }
    }
}

let n = Int(readLine()!)!

var cols: [Bool] = Array(repeating: false, count: n)
var diagonal1: [Bool] = Array(repeating: false, count: 2 * n - 1)
var diagonal2: [Bool] = Array(repeating: false, count: 2 * n - 1)

var result = 0

dfs(0)

print(result)
