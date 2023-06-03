//
//  경주로 건설.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/16.
//

import Foundation

//visited를 비용으로 관리함
//저장된 비용보다 싸다면 방문한다.
//코너 : direction과 1 차이가 나면 코너임

typealias Node = (x: Int, y: Int, dir: Int, cost: Int)
//상하좌우
let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

func solution(_ board: [[Int]]) -> Int {
    let size = board.count
    var visited: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: Int.max, count: 4), count: size), count: size)
    
    var queue: [Node] = [(0, 0, 1, 0), (0, 0, 3, 0)]
    var index = 0
    
    visited[0][0][1] = 0
    visited[0][0][3] = 0
    
    var result = Int.max
    while index < queue.count {
        let (x, y, dir, cost) = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            let isStraight = ((dir == 0 || dir == 1) && (i == 0 || i == 1)) || ((dir == 2 || dir == 3) && (i == 2 || i == 3))
            let nc = isStraight ? cost + 100 : cost + 600
            guard (0..<size) ~= nx, (0..<size) ~= ny, board[nx][ny] == 0 else {
                continue
            }
            
            if visited[nx][ny][i] > nc {
                visited[nx][ny][i] = nc
                queue.append((nx, ny, i, nc))
            }
        }
    }
    
    return visited[size-1][size-1].min()!
}
