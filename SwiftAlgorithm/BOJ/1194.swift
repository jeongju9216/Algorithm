//
//  1194.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/23.
//

import Foundation

typealias Item = (x: Int, y: Int, count: Int, key: Int)

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

func bfs() -> Int {
    var queue: [Item] = [start]
    var index = 0
    
    var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: 1 << 6), count: m), count: n)
    visited[start.x][start.y][0] = true
    
    var outCount = Int.max
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        if map[node.x][node.y] == "1" {
            outCount = min(outCount, node.count)
            continue
        }
        
        let key = node.key
        for i in 0..<4 {
            let nextX = node.x + dx[i]
            let nextY = node.y + dy[i]
            let nextCount = node.count + 1
            
            guard (0..<n) ~= nextX, (0..<m) ~= nextY, !visited[nextX][nextY][key] else {
                continue
            }
            
            let mapItem = map[nextX][nextY]
            
            if mapItem == "." || mapItem == "1" { //빈 칸, 출구
                queue.append((nextX, nextY, nextCount, key))
                visited[nextX][nextY][key] = true
            } else if ("a"..."f") ~= mapItem {
                let newBitmask = 1 << (UnicodeScalar(mapItem)!.value - UnicodeScalar("a").value)
                let newKey = key | newBitmask
                                
                queue.append((nextX, nextY, nextCount, newKey))
                visited[nextX][nextY][key] = true
                visited[nextX][nextY][newBitmask] = true
            } else if ("A"..."F") ~= mapItem {
                let newBitmask = 1 << (UnicodeScalar(mapItem)!.value - UnicodeScalar("A").value)
                let isOpen = (key & newBitmask) != 0
                
                if isOpen {
                    queue.append((nextX, nextY, nextCount, key))
                    visited[nextX][nextY][key] = true
                }
            }
        }
    }
    
    if outCount == Int.max {
        outCount = -1
    }
    
    return outCount
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var start: Item = (-1, -1, 0, 0)
var map: [[String]] = []
for i in 0..<n {
    let input = Array(readLine()!).map { String($0) }
    map.append(input)
    
    if start.x == -1 && start.y == -1 {
        for j in 0..<m {
            if map[i][j] == "0" {
                start = (i, j, 0, 0)
                map[i][j] = "."
                break
            }
        }
    }
}

let result = bfs()
print(result)
