//
//  2206.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/12.
//

import Foundation

//부술 수 있느냐 없느냐를 함께 visited로 해서 최단 경로를 찾는다.

typealias Node = (x: Int, y: Int, cnt: Int, breakCount: Int)

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

let nm = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nm[0], m = nm[1]
var map: [[Int]] = []
for _ in 0..<n {
    map.append(Array(readLine()!).map { Int(String($0))! })
}

var queue: [Node] = [(0, 0, 0, 0)]
var index = 0

var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: m), count: n)
visited[0][0][0] = true

var result = Int.max
while index < queue.count {
    let (x, y, cnt, breakCount) = queue[index]
    index += 1
    
    if x == n-1 && y == m-1 {
        result = cnt + 1
        break
    }
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        let nc = cnt + 1
        
        guard (0..<n) ~= nx, (0..<m) ~= ny else {
            continue
        }
        
        if breakCount < 1 {
            //벽을 안 부실 때
            if !visited[nx][ny][0] && map[nx][ny] == 0 {
                visited[nx][ny][0] = true
                queue.append((nx, ny, nc, 0))
            }
            
            if !visited[nx][ny][1] {
                visited[nx][ny][1] = true
                queue.append((nx, ny, nc, 1))
            }
        } else {
            if !visited[nx][ny][1] && map[nx][ny] == 0 {
                visited[nx][ny][1] = true
                queue.append((nx, ny, nc, 1))
            }
        }
    }
}

if result == Int.max {
    print(-1)
} else {
    print(result)
}
