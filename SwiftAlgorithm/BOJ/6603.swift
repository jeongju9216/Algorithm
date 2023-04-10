//
//  6603.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

func backtracking(_ current: [Int], _ start: Int) {
    if current.count == 6 {
        for num in current {
            print(num, terminator: " ")
        }
        print("")
        return
    }
    
    for i in start..<k where !visited[i] {
        visited[i] = true
        backtracking(current + [nums[i]], i)
        visited[i] = false
    }
}

var input: [Int] = [-1]
var k = 0
var nums: [Int] = []
var visited: [Bool] = []
while true {
    input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    if input[0] == 0 {
        exit(0)
    }
    
    k = input[0]
    nums = Array(input[1...])
    visited = Array(repeating: false, count: k)

    backtracking([], 0)
    
    print("")
}
