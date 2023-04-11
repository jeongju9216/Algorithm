//
//  2668.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/11.
//

import Foundation

func dfs(_ num: Int, _ start: Int) {
    if !visited[num] {
        visited[num] = true
        dfs(arr[num], start)
    } else {
        //사이클 유무 반환
        canCycle = num == start
    }
}

let n = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<n {
    arr.append(Int(readLine()!)! - 1)
}

var visited: [Bool] = Array(repeating: false, count: n)
var canCycle = false
var result: [Int] = []
for i in 0..<n {
    visited = Array(repeating: false, count: n)
    canCycle = false
    
    dfs(i, i)
    if canCycle {
        result.append(i + 1)
    }
}

print(result.count)
for num in result {
    print(num)
}
