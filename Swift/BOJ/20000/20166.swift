//
//  20166.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/13.
//

import Foundation

let dx = [-1, -1, 0, 1, 1, 1, 0, -1]
let dy = [0, 1, 1, 1, 0, -1, -1, -1]

func dfs(_ x: Int, _ y: Int, _ current: String, _ depth: Int) {
    if depth > 5 {
        return
    }
    
    dict[current, default: 0] += 1
    
    for i in 0..<8 {
        var nx = x + dx[i]
        var ny = y + dy[i]
        
        if nx < 0 { nx += n }
        if nx >= n { nx -= n }
        
        if ny < 0 { ny += m }
        if ny >= m { ny -= m }
        
        dfs(nx, ny, current + board[nx][ny], depth + 1)
    }
}

let nmk = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nmk[0], m = nmk[1], k = nmk[2]

var board: [[String]] = []
for _ in 0..<n {
    let input = Array(readLine()!).map { String($0) }
    board.append(input)
}

var arr: [String] = []
for _ in 0..<k {
    let input = readLine()!
    arr.append(input)
}

var dict: [String: Int] = [:]

for i in 0..<n {
    for j in 0..<m {
        dfs(i, j, board[i][j], 1)
    }
}

for string in arr {
    print(dict[string] ?? 0)
}
