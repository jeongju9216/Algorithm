//
//  4485.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/23.
//

import Foundation

typealias Node = (x: Int, y: Int)
let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

var time = 1
while let n = Int(readLine()!), n >= 2 {
    var map: [[Int]] = []
    for _ in 0..<n {
        let input = readLine()!.split { $0 == " " }.map { Int($0)! }
        map.append(input)
    }
    
    var queue: [Node] = [(0, 0)]
    var visited: [[Int]] = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    visited[0][0] = map[0][0]
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        for i in 0..<4 {
            let nx = node.x + dx[i]
            let ny = node.y + dy[i]
            
            guard (0..<n) ~= nx, (0..<n) ~= ny else {
                continue
            }
            
            let nCost = visited[node.x][node.y] + map[nx][ny]
            
            if visited[nx][ny] > nCost {
                visited[nx][ny] = nCost
                queue.append((nx, ny))
            }
        }
    }
    
    print("Problem \(time): \(visited[n-1][n-1])")
    time += 1
}
