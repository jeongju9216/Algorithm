//
//  463.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/21.
//

import Foundation

class Solution {
    
    let dx: [Int] = [-1, 1, 0, 0]
    let dy: [Int] = [0, 0, -1, 1]
    
    func countingResult(_ grid: [[Int]], _ i: Int, _ j: Int) -> Int {
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        var count: Int = 0
        
        var queue: [(x: Int, y: Int)] = [(i, j)]
        var index: Int = 0
        
        visited[i][j] = true
        
        while index < queue.count {
            let node = queue[index]
            index += 1
            
            for i in 0..<4 {
                let nextX: Int = node.x + dx[i]
                let nextY: Int = node.y + dy[i]
                
                //경계
                guard (0..<grid.count) ~= nextX && (0..<grid[0].count) ~= nextY else {
                    count += 1
                    continue
                }
                
                if !visited[nextX][nextY] {
                    if grid[nextX][nextY] == 1 { //땅
                        visited[nextX][nextY] = true
                        queue.append((nextX, nextY))
                    } else { //물가
                        count += 1
                    }
                }
            }
        }
        
        return count
    }
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        //경계일 때 +1
        //옆이 강일 때 +1
        //dx, dy로 for 돌 때 count 하기
        
        var result: Int = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    result = countingResult(grid, i, j)
                    break
                }
            }
        }
        
        return result
    }
}
