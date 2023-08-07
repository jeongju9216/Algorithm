//
//  18429.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

func backtracking(_ current: [Int], _ sum: Int) {
    if current.count == n {
        set.insert(current)
        return
    }
    
    for i in 0..<n where !visited[i] {
        if sum + weights[i] - k >= 500 {
            visited[i] = true
            backtracking(current + [i], sum + weights[i] - k)
            visited[i] = false
        }
    }
}

let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]

let weights = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var visited: [Bool] = Array(repeating: false, count: n)
var set: Set<[Int]> = []

var result = 0
backtracking([], 500)

print(set.count)
