//
//  9466.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/12.
//

import Foundation

//사이클이 만들어지면 같은 팀
//n - 팀 인원 개수

func dfs(_ num: Int) {
    visited[num] = true
    team.append(num)
    
    let pick = input[num]
    if !visited[pick] {
        dfs(pick)
    } else {
        if let firstIndex = team.firstIndex(of: pick) {
            count += Array(team[firstIndex...]).count
        }
    }
}

let testcase = Int(readLine()!)!
var n = 0
var input: [Int] = []
var visited: [Bool] = []
var team: [Int] = []
var count = 0
for _ in 0..<testcase {
    n = Int(readLine()!)!
    input = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
    visited = Array(repeating: false, count: n)
    count = 0
    for i in 0..<n {
        if !visited[i] {
            team = []
            dfs(i)
        }
    }
    
    let result = n - count
    print(result)
}
