//
//  7576.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/14.
//

import Foundation

typealias Point = (x: Int, y: Int, day: Int)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

let mn = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (m, n) = (mn[0], mn[1])

var queue: [Point] = []
var map: [[Int]] = []
var tomatoCount = 0
for i in 0..<n {
    let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    map.append(arr)
    
    for j in 0..<m {
        if map[i][j] == 1 {
            queue.append((i, j, 0))
        }
        
        if map[i][j] != -1 {
            tomatoCount += 1
        }
    }
}

var result = 0
var index = 0
while index < queue.count {
    let (x, y, day) = queue[index]
    index += 1
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        guard 0..<n ~= nx, 0..<m ~= ny, map[nx][ny] == 0 else {
            continue
        }
        
        map[nx][ny] = 1
        result = max(result, day + 1)
        queue.append((nx, ny, day + 1))
    }
}

if tomatoCount == index {
    print(result)
} else {
    print("-1")
}
