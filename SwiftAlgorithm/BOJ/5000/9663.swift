//
//  9663.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/22.
//

import Foundation

func check(_ row: Int, _ col: Int) -> Bool {
    if cols[col] || diagonal1[row+col] || diagonal2[row-col+n-1] {
        return false
    }
    
    return true
}


func dfs(_ row: Int) {
    if row == n {
        result += 1
        return
    }
    
    for col in 0..<n {
        if check(row, col) {
            cols[col] = true
            diagonal1[row+col] = true
            diagonal2[row-col+n-1] = true
            
            dfs(row+1)
            
            cols[col] = false
            diagonal1[row+col] = false
            diagonal2[row-col+n-1] = false
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
