//
//  1520.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/09.
//

import Foundation

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func dfs(_ x: Int, _ y: Int) -> Int {
    if x == m - 1 && y == n - 1 {
        return 1
    }
    
    //최초 진입
    if visited[x][y] == -1 {
        visited[x][y] = 0
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            guard 0..<m ~= nx, 0..<n ~= ny, map[nx][ny] < map[x][y] else {
                continue
            }
            
            //x, y에서 끝까지 갈 수 있는 경로 개수
            visited[x][y] += dfs(nx, ny)
        }
    }
    
    return visited[x][y]
}

let mn = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let m = mn[0], n = mn[1]
var map: [[Int]] = []
for _ in 0..<m {
    map.append(readLine()!.split { $0 == " " }.map { Int(String($0))! })
}

var visited: [[Int]] = Array(repeating: Array(repeating: -1, count: n), count: m)
let result = dfs(0, 0)
print(result)
