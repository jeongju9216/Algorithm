//
//  200.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/26.
//

import Foundation

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let dx: [Int] = [-1, 1, 0, 0]
        let dy: [Int] = [0, 0, -1, 1]
        
        var grid: [[Int]] = grid.map { $0.map { Int(String($0))! } }
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        var result: Int = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if Int(String(grid[i][j]))! == 1 && !visited[i][j] {
                    result += 1
                    
                    var queue: [(x: Int, y: Int)] = [(i, j)]
                    var index: Int = 0
        
                    while index < queue.count {
                        let node = queue[index]
                        index += 1

                        for t in 0..<4 {
                            let nextX = node.x + dx[t]
                            let nextY = node.y + dy[t]

                            if (0..<grid.count) ~= nextX && (0..<grid[0].count) ~= nextY {
                                if Int(String(grid[nextX][nextY]))! == 1 && !visited[nextX][nextY] {
                                    visited[nextX][nextY] = true
                                    grid[nextX][nextY] = 0
                                    
                                    queue.append((nextX, nextY))
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return result
    }
}
