//
//  리코쳇 로봇.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/03.
//

import Foundation

typealias Point = (x: Int, y: Int, cost: Int)

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]
var result = Int.max

func solution(_ board:[String]) -> Int {
        
    let board = board.map { Array($0).map { String($0) } }
    let xRange = (0..<board.count), yRange = (0..<board[0].count)

    var start: Point = (-1, -1, 0)
    for i in 0..<board.count where start == (-1, -1, 0) {
        for j in 0..<board[i].count where board[i][j] == "R" {
            start = (i, j, 0)
            break
        }
    }
    
    var queue: [Point] = [start]
    var index = 0
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
    visited[start.x][start.y] = true
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        if board[node.x][node.y] == "G" {
            result = min(result, node.cost)
            continue
        }
        
        for i in 0..<4 {
            var nx = node.x + dx[i]
            var ny = node.y + dy[i]
            
            guard xRange ~= nx, yRange ~= ny else {
                continue
            }
            
            switch i {
            case 0, 1:
                while xRange ~= nx, yRange ~= ny, board[nx][ny] != "D" {
                    nx += dx[i]
                }
                nx -= dx[i]
            case 2, 3:
                while xRange ~= nx, yRange ~= ny, board[nx][ny] != "D" {
                    ny += dy[i]
                }
                ny -= dy[i]
            default: break
            }
            
            if !visited[nx][ny] {
                visited[nx][ny] = true
                queue.append((nx, ny, node.cost + 1))
            }
        }
    }
    
    if result == Int.max {
        return -1
    } else {
        return result
    }
}
