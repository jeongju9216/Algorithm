//
//  1600.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/12.
//

import Foundation

typealias Point = (x: Int, y: Int, cnt: Int, k: Int)

let dx = [-1, 1, 0, 0, -2, -1, 1, 2, 2, 1, -1, -2]
let dy = [0, 0, -1, 1, 1, 2, 2, 1, -1, -2, -2, -1]

var k = Int(readLine()!)!
let wh = readLine()!.split { $0 == " " }.map { Int($0)! }
let w = wh[0], h = wh[1]
var map: [[Int]] = []
for _ in 0..<h {
    map.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

var queue: [Point] = [(0, 0, 0, k)]
var index = 0

var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: k+1), count: w), count: h)
visited[0][0][k] = true

var result = Int.max
while index < queue.count {
    let node = queue[index]
    index += 1
    
    if node.x == h - 1 && node.y == w - 1 {
        result = node.cnt
        break
    }
    
    let time = node.k > 0 ? 12 : 4
    for i in 0..<time {
        let nx = node.x + dx[i]
        let ny = node.y + dy[i]
        let nc = node.cnt + 1
        let nk = i < 4 ? node.k : max(node.k - 1, 0)
        
        guard (0..<h) ~= nx, (0..<w) ~= ny, !visited[nx][ny][nk] else {
            continue
        }
        
        if map[nx][ny] == 0 {
            visited[nx][ny][nk] = true
            queue.append((nx, ny, nc, nk))
        }
    }
}

if result == Int.max {
    print("-1")
} else {
    print(result)
}
