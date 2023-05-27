//
//  4178.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/12.
//

import Foundation

typealias Point = (x: Int, y: Int, cnt: Int)

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

let rc = readLine()!.split { $0 == " " }.map { Int($0)! }
let r = rc[0], c = rc[1]
var map: [[String]] = []

var man: Point = (-1, -1, 0)
var fire: [Point] = []
for i in 0..<r {
    map.append(Array(readLine()!).map { String($0) })
    for j in 0..<c {
        if map[i][j] == "J" {
            man.x = i
            man.y = j
        }
        
        if map[i][j] == "F" {
            fire.append((i, j, 0))
        }
    }
}

var queue: [Point] = fire
var index = 0

var visited: [[Int]] = Array(repeating: Array(repeating: Int.max, count: c), count: r)
queue.forEach { visited[$0.x][$0.y] = $0.cnt }

while index < queue.count {
    let node = queue[index]
    index += 1
    
    for i in 0..<4 {
        let nx = node.x + dx[i]
        let ny = node.y + dy[i]
        let nCount = node.cnt + 1
        
        guard (0..<r) ~= nx, (0..<c) ~= ny else {
            continue
        }
        
        if map[nx][ny] == "." && nCount < visited[nx][ny] {
            visited[nx][ny] = nCount
            queue.append((nx, ny, nCount))
        }
    }
}

queue = [man]
index = 0
visited[man.x][man.y] = 0
while index < queue.count {
    let node = queue[index]
    index += 1
    
    for i in 0..<4 {
        let nx = node.x + dx[i]
        let ny = node.y + dy[i]
        let nCount = node.cnt + 1
        
        guard (0..<r) ~= nx, (0..<c) ~= ny else {
            print(nCount)
            exit(0)
            break
        }
        
        if map[nx][ny] == "." && nCount < visited[nx][ny] {
            visited[nx][ny] = nCount
            queue.append((nx, ny, nCount))
        }
    }
}

print("IMPOSSIBLE")
