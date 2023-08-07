//
//  16932.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/12.
//

import Foundation

typealias Node = (x: Int, y: Int, cnt: Int)
let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

func bfs(_ x: Int, _ y: Int, _ id: Int) {
    var queue: [Node] = [(x, y, 1)]
    var index = 0
    visited[x][y] = id
    
    while index < queue.count {
        let (x, y, count) = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            guard (0..<n) ~= nx, (0..<m) ~= ny else {
                continue
            }
            
            if visited[nx][ny] == -1 && map[nx][ny] == 1 {
                visited[nx][ny] = id
                queue.append((nx, ny, count + 1))
            }
        }
    }
    
    counts.append(queue.count)
}

let nm = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nm[0], m = nm[1]
var map: [[Int]] = []
for _ in 0..<n {
    map.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

var visited: [[Int]] = Array(repeating: Array(repeating: -1, count: m), count: n)
var counts: [Int] = []
var zeros: [Node] = []
var groupCount = 0
for i in 0..<n {
    for j in 0..<m {
        if map[i][j] == 0 {
            zeros.append((i, j, 0))
        }
        
        if map[i][j] == 1 && visited[i][j] == -1 {
            bfs(i, j, groupCount)
            groupCount += 1
        }
    }
}

var result = 0
for zero in zeros {
    var ids: Set<Int> = []
    var sum = 1
    for k in 0..<4 {
        let nx = zero.x + dx[k]
        let ny = zero.y + dy[k]
        
        guard (0..<n) ~= nx, (0..<m) ~= ny, map[nx][ny] == 1 else {
            continue
        }
        
        if !ids.contains(visited[nx][ny]) {
            ids.insert(visited[nx][ny])
            sum += counts[visited[nx][ny]]
        }
    }
    
    result = max(result, sum)
}

print(result)
