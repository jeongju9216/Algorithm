//
//  695.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/21.
//

import Foundation

class Solution {
    
    let dx: [Int] = [-1, 1, 0, 0], dy: [Int] = [0, 0, -1, 1]
    
    func checkIsland(_ grid: [[Int]], _ i: Int, _ j: Int, _ visited: inout [[Bool]]) -> Int {
        var queue: [(x: Int, y: Int)] = [(i, j)]
        var index: Int = 0
        visited[i][j] = true

        while index < queue.count {
            let node = queue[index]
            index += 1

            for i in 0..<4 {
                let nextX = node.x + dx[i]
                let nextY = node.y + dy[i]

                guard (0..<grid.count) ~= nextX && (0..<grid[0].count) ~= nextY else {
                    continue
                }
                
                if grid[nextX][nextY] == 1 && !visited[nextX][nextY] {
                    visited[nextX][nextY] = true
                    queue.append((nextX, nextY))
                }
            }
        }
        
        return index
    }
    
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        
        var maxArea: Int = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 && !visited[i][j] {
                    maxArea = max(maxArea, checkIsland(grid, i, j, &visited))
                }
            }
        }
        
        return maxArea
    }
}
