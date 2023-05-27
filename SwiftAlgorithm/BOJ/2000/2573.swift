//
//  2573.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/12.
//

import Foundation

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

func bfs(_ x: Int, _ y: Int, _ tmpMap: [[Int]]) {
    var queue: [(x: Int, y: Int)] = [(x, y)]
    var index = 0
    visited[x][y] = true
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = node.x + dx[i]
            let ny = node.y + dy[i]
            
            guard (0..<n) ~= nx, (0..<m) ~= ny, !visited[nx][ny] else {
                continue
            }
            
            if tmpMap[nx][ny] > 0 {
                visited[nx][ny] = true
                queue.append((nx, ny))
            } else {
                map[node.x][node.y] -= 1
            }
        }
    }
}

let nm = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nm[0], m = nm[1]
var map: [[Int]] = []
for _ in 0..<n {
    map.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

var visited: [[Bool]] = []
var result = 0
while true {
    var isSplit = false
    visited = Array(repeating: Array(repeating: false, count: m), count: n)
    
    var flag = true
    for i in 0..<n where !isSplit {
        for j in 0..<m {
            if !visited[i][j] && map[i][j] > 0 {
                if flag {
                    flag = false
                } else {
                    isSplit = true
                    break
                }
                
                bfs(i, j, map)
            }
        }
    }
    
    if flag {
        result = 0
        break
    }
    
    if isSplit {
        break
    }
    
    result += 1
}

print(result)
