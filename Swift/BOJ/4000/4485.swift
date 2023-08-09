//
//  4485.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/23.
//

import Foundation

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var cnt = 0
while true {
    cnt += 1
    let n = Int(readLine()!)!
    if n == 0 {
        break
    }
    
    var map: [[Int]] = []
    for _ in 0..<n {
        map.append(readLine()!.split { $0 == " " }.map { Int(String($0))! })
    }
    
    var visited: [[Int]] = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    visited[0][0] = map[0][0]
    
    var queue: [(x: Int, y: Int)] = [(0, 0)]
    var index = 0
    while index < queue.count {
        let node = queue[index]
        index += 1

        for i in 0..<4 {
            let nx = node.x + dx[i]
            let ny = node.y + dy[i]
            
            guard 0..<n ~= nx, 0..<n ~= ny,
                  visited[nx][ny] > visited[node.x][node.y] + map[nx][ny] else {
                continue
            }
            
            visited[nx][ny] = visited[node.x][node.y] + map[nx][ny]
            queue.append((nx, ny))
        }
    }
    
    print("Problem \(cnt): \(visited[n-1][n-1])")
}
