//
//  1520.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/23.
//

import Foundation

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

func dfs(_ x: Int, _ y: Int) -> Int {
    if x == m-1 && y == n-1 {
        return 1
    }
    
    if visited[x][y] == -1 {
        visited[x][y] = 0
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            guard (0..<m) ~= nx, (0..<n) ~= ny else {
                continue
            }
            
            if map[x][y] > map[nx][ny] {
                visited[x][y] += dfs(nx, ny)
            }
        }
    }
    
    return visited[x][y]
}

let mn = readLine()!.split { $0 == " " }.map { Int($0)! }
let (m, n) = (mn[0], mn[1])

var map: [[Int]] = []
for _ in 0..<m {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    map.append(input)
}

var visited: [[Int]] = Array(repeating: Array(repeating: -1, count: n), count: m)

let result = dfs(0, 0)

print(result)
