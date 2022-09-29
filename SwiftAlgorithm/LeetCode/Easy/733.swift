//
//  733.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/29.
//

import Foundation

class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        //bfs
        //시작 좌표를 start로 넣음
        //상하좌우 살피면서 같은 색이면 다음 노드로 넣기
        
        var image = image
        
        let dx: [Int] = [-1, 1, 0, 0]
        let dy: [Int] = [0, 0, -1, 1]
        
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: image[0].count), count: image.count)
        
        var queue: [(x: Int, y: Int)] = [(sr, sc)]
        var index: Int = 0
        visited[sr][sc] = true
        
        let changeColor: Int = image[sr][sc]
                                    
        while index < queue.count {
            let node = queue[index]
            index += 1
            
            image[node.x][node.y] = color
            
            for i in 0..<4 {
                let nextX: Int = node.x + dx[i]
                let nextY: Int = node.y + dy[i]
                
                guard (0..<image.count) ~= nextX && (0..<image[0].count) ~= nextY else {
                    continue
                }
                
                if !visited[nextX][nextY] && image[nextX][nextY] == changeColor {
                    visited[nextX][nextY] = true
                    queue.append((nextX, nextY))
                }
            }
        }
                                      
        return image
    }
}
