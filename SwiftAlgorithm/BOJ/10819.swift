//
//  10819.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

func backtracking(_ arr: [Int]) {
    if arr.count == n {
        var sum = 0
        
        for i in 0..<n-1 {
            sum += abs(input[arr[i]] - input[arr[i + 1]])
        }
        
        result = max(result, sum)
        
        return
    }
    
    for i in 0..<n where !visited[i] {
        visited[i] = true
        backtracking(arr + [i])
        visited[i] = false
    }
}

let n = Int(readLine()!)!
let input = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted()
var visited: [Bool] = Array(repeating: false, count: n)

var result = Int.min

backtracking([])

print(result)
