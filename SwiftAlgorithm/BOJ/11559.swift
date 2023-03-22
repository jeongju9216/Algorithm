//
//  11559.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/22.
//

import Foundation

func bfs(_ x: Int, _ y: Int, _ item: String, _ visited: [[Bool]]) -> Bool {
    var visited = visited
    
    var queue: [(Int, Int)] = [(x, y)]
    var index = 0
    visited[x][y] = true
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nextX = node.0 + dx[i]
            let nextY = node.1 + dy[i]
            
            guard (0..<6) ~= nextX, (0..<12) ~= nextY else {
                continue
            }
            
            if !visited[nextX][nextY] {
                if map[nextX][nextY] == item {
                    queue.append((nextX, nextY))
                    visited[nextX][nextY] = true
                }
            }
        }
    }
    
    if queue.count >= 4 {
        for item in queue {
            map[item.0][item.1] = "-"
        }
        
        return true
    } else {
        return false
    }
}


var map: [[String]] = Array(repeating: [], count: 6)
for i in 0..<12 {
    let input = Array(readLine()!).map { String($0) }
    for j in 0..<6 {
        map[j].append(input[j])
    }
}

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

map = map.map { $0.reversed() }

var result = 0
while true {
    var isPop = false
    
    let visited: [[Bool]] = Array(repeating: Array(repeating: false, count: 12), count: 6)
    for i in 0..<6 {
        for j in 0..<12 {
            if map[i][j] == "." || map[i][j] == "-" {
                continue
            }
            
            isPop = bfs(i, j, map[i][j], visited) || isPop
        }
    }
    
    if isPop {
        result += 1
        
        for i in 0..<6 {
            var jj = 0
            for j in 0..<12 {
                if map[i][jj] == "-" {
                    map[i].remove(at: jj)
                    map[i].append(".")
                } else {
                    jj += 1
                }
            }
        }
    } else {
        break
    }
}

print(result)
