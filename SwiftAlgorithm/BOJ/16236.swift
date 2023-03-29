//
//  16236.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/28.
//

import Foundation

//상 좌 우 하
let dx = [-1, 0, 0, 1], dy = [0, -1, 1, 0]

typealias Point = (x: Int, y: Int, time: Int)

let n = Int(readLine()!)!
var map: [[Int]] = []
var shark: Point = (-1, -1, 0)
for i in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    map.append(input)
    
    if shark == (-1, -1, 0) {
        for j in 0..<map[i].count {
            if map[i][j] == 9 {
                shark = (i, j, 0)
                map[i][j] = 0
            }
        }
    }
}

var sharkSize = 2, eatCount = 0
var time = 0
while true {
    var isEat = false
    
    shark.time = 0
    var queue = [shark]
    var index = 0
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
    visited[shark.x][shark.y] = true

    while index < queue.count {
        let node = queue[index]
        index += 1
        
        let item = map[node.x][node.y]
        if item > 0 && item < sharkSize {
            isEat = true
            shark.time = node.time
            break
        }
        
        for i in 0..<4 {
            let nx = node.x + dx[i]
            let ny = node.y + dy[i]
            
            guard (0..<n) ~= nx, (0..<n) ~= ny, !visited[nx][ny] else {
                continue
            }
            
            visited[nx][ny] = true
            if map[nx][ny] <= sharkSize {
                queue.append((nx, ny, node.time + 1))
            }
        }
    }
    
    if isEat {
        queue = queue.filter { $0.time == shark.time }
            .filter { map[$0.x][$0.y] > 0 && map[$0.x][$0.y] < sharkSize }
            .sorted { $0.x != $1.x ? $0.x < $1.x : $0.y < $1.y }
        let eatted = queue.first!
        map[eatted.x][eatted.y] = 0
        shark = (eatted.x, eatted.y, eatted.time)

        time += shark.time
        eatCount += 1
        if sharkSize == eatCount {
            sharkSize += 1
            eatCount = 0
        }
    } else {
        break
    }
}

print(time)
