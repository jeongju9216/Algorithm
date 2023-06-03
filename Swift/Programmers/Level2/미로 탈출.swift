//
//  미로 탈출.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/03.
//

import Foundation

typealias Point = (x: Int, y: Int, count: Int)
let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

func solution(_ maps:[String]) -> Int {
    
    let map: [[String]] = maps.map { Array($0).map { String($0) } }
    var start: Point = (-1, -1, 0)
    var lever: Point = (-1, -1, 0)
    for i in 0..<maps.count {
        for j in 0..<maps[0].count {
            if map[i][j] == "S" {
                start = (i, j, 0)
            } else if map[i][j] == "L" {
                lever = (i, j, 0)
            }
        }
    }
    
    var queue: [Point] = [start]
    var index = 0
    var visited: [[Bool]] = []
    visited = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)
    visited[start.x][start.y] = true
    
    //레버 찾기
    var result = Int.max
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        if map[node.x][node.y] == "L" {
            result = min(result, node.count)
            break
        }
        
        for i in 0..<4 {
            let nx = node.x + dx[i]
            let ny = node.y + dy[i]
            
            guard (0..<map.count) ~= nx, (0..<map[0].count) ~= ny, !visited[nx][ny] else {
                continue
            }
            
            visited[nx][ny] = true
            if map[nx][ny] != "X" {
                queue.append((nx, ny, node.count + 1))
            }
        }
    }
    
    if result == Int.max {
        return -1
    }
    
    queue = [lever]
    index = 0
    visited = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)
    visited[lever.x][lever.y] = true
    
    var result2 = Int.max
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        if map[node.x][node.y] == "E" {
            result2 = min(result2, node.count)
            break
        }
        
        for i in 0..<4 {
            let nx = node.x + dx[i]
            let ny = node.y + dy[i]
            
            guard (0..<map.count) ~= nx, (0..<map[0].count) ~= ny, !visited[nx][ny] else {
                continue
            }
            
            visited[nx][ny] = true
            if map[nx][ny] != "X" {
                queue.append((nx, ny, node.count + 1))
            }
        }
    }
 
    if result2 == Int.max {
        return -1
    } else {
        return result + result2
    }
}
