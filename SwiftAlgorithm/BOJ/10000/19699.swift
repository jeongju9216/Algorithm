//
//  19699.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

func isPrime(_ num: Int) -> Bool {
    guard num >= 4 else {
        return num >= 1
    }
    
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {
            return false
        }
    }
    return true
}

func backtracking(_ current: [Int], _ index: Int) {
    if current.count == m {
        let sum = current.reduce(0, +)
        if isPrime(sum) {
            result.insert(sum)
        }
        return
    }
    
    for i in index..<n where !visited[i] {
        visited[i] = true
        backtracking(current + [cows[i]], i)
        visited[i] = false
    }
}

let nm = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nm[0], m = nm[1]
let cows = readLine()!.split { $0 == " " }.map { Int($0)! }

var visited: [Bool] = Array(repeating: false, count: n)
var result: Set<Int> = []

backtracking([], 0)

if result.isEmpty {
    print("-1")
} else {
    for num in result.sorted() {
        print(num, terminator: " ")
    }
}

