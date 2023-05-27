//
//  22944.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

struct Item {
    var x: Int
    var y: Int
    var h: Int
    var cost: Int
    var count: Int
}

func bfs() {
    var queue: [Item] = [start]
    var index = 0
    
    var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    visited[start.x][start.y] = start.h
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = node.x + dx[i]
            let ny = node.y + dy[i]
            
            guard (0..<n) ~= nx, (0..<n) ~= ny else {
                continue
            }
            
            var cost = node.cost
            var hp = node.h
            if map[nx][ny] == "U" {
                cost = d
            }
            
            if map[nx][ny] == "E" {
                result = node.count + 1
                return
            }
            
            if cost > 0 {
                cost -= 1
            } else {
                hp -= 1
            }
            
            if hp <= 0 {
                continue
            }
            
            if hp + cost > visited[nx][ny] {
                visited[nx][ny] = hp + cost
                queue.append(Item(x: nx, y: ny, h: hp, cost: cost, count: node.count + 1))
            }
        }
    }
}

let nhd = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nhd[0], h = nhd[1], d = nhd[2]

var map: [[String]] = []
var start: Item = Item(x: -1, y: -1, h: h, cost: 0, count: 0)
for i in 0..<n {
    let input = Array(readLine()!).map { String($0) }
    map.append(input)
    
    if start.x == -1 {
        for j in 0..<n where map[i][j] == "S" {
            start.x = i
            start.y = j
        }
    }
}

var result = Int.max

bfs()

if result == Int.max {
    print("-1")
} else {
    print(result)
}
