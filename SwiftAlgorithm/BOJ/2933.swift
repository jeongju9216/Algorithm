//
//  2933.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/22.
//

import Foundation

func printMap() {
    for line in map {
        for item in line {
            print(item, terminator: "")
        }
        print("")
    }
}

func bfs(_ x: Int, _ y: Int) -> [(x: Int, y: Int)] {
    var visited = Array(repeating: Array(repeating: false, count: c), count: r)
    visited[x][y] = true
    
    var queue: [(x: Int, y: Int)] = [(x, y)]
    var index = 0
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        //하나로 이어져 있음
        if node.x == r - 1 {
            return []
        }
        
        for i in 0..<4 {
            let nextX = node.x + dx[i]
            let nextY = node.y + dy[i]
            
            guard (0..<r) ~= nextX, (0..<c) ~= nextY else {
                continue
            }
            
            if !visited[nextX][nextY] && map[nextX][nextY] == "x" {
                queue.append((nextX, nextY))
                visited[nextX][nextY] = true
            }
        }
    }
    
    return queue
}

func down(items: [(x: Int, y: Int)]) {
    for item in items {
        map[item.x][item.y] = "."
    }
    
    for i in 1..<r {
        let movingItems: [(x: Int, y: Int)] = items.map { ($0.x + i, $0.y) }
        
        var canMove = true
        for movingItem in movingItems {
            guard (0..<r) ~= movingItem.x, (0..<c) ~= movingItem.y,
                    map[movingItem.x][movingItem.y] != "x" else {
                canMove = false
                break
            }
        }
        
        if !canMove {
            let moveCount = i - 1
            for item in items {
                map[item.x + moveCount][item.y] = "x"
            }
            break
        }
    }
}

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

let rc = readLine()!.components(separatedBy: " ").map { Int($0)! }
let r = rc[0], c = rc[1]
var map: [[String]] = []
for _ in 0..<r {
    let input = Array(readLine()!).map { String($0) }
    map.append(input)
}

let _ = Int(readLine()!)!
let heights = readLine()!.components(separatedBy: " ").map { Int($0)! }

var isShootLeftToRight = true
for height in heights {
    let shootHeight = r - height
    var index = -1
    
    if isShootLeftToRight {
        guard let removeIndex = map[shootHeight].firstIndex(of: "x") else {
            isShootLeftToRight.toggle()
            continue
        }
        index = removeIndex
    } else {
        guard let removeIndex = map[shootHeight].lastIndex(of: "x") else {
            isShootLeftToRight.toggle()
            continue
        }
        index = removeIndex
    }
    
    map[shootHeight][index] = "."

    for i in 0..<4 {
        let nextX = shootHeight + dx[i]
        let nextY = index + dy[i]
        
        guard (0..<r) ~= nextX, (0..<c) ~= nextY else {
            continue
        }
        
        if map[nextX][nextY] == "x" {
            let items = bfs(nextX, nextY)
            if !items.isEmpty {
                down(items: items)
                break
            }
        }
    }
    
    isShootLeftToRight.toggle()
}

printMap()
