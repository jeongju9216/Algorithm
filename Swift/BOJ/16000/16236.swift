//
//  16236.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/16.
//

import Foundation

typealias Point = (x: Int, y: Int, time: Int)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]


let n = Int(readLine()!)!
var map: [[Int]] = []
for _ in 0..<n {
    map.append(readLine()!.split { $0 == " " }.map { Int(String($0))! })
}

var shark: Point = (0, 0, 0)
var size = 2, eatCount = 0
var result = 0

for i in 0..<n {
    for j in 0..<n {
        if map[i][j] == 9 {
            shark.x = i
            shark.y = j
        }
    }
}

while true {
    var queue: [Point] = [shark]
    var index = 0
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
    visited[shark.x][shark.y] = true
    
    var fishes: [Point] = []
    
    while index < queue.count {
        let item = queue[index]
        index += 1
        
        if let first = fishes.first, item.time >= first.time {
            break
        }
        
        for i in 0..<4 {
            let nx = item.x + dx[i]
            let ny = item.y + dy[i]
            let nt = item.time + 1
            
            guard 0..<n ~= nx, 0..<n ~= ny, !visited[nx][ny], map[nx][ny] <= size else {
                continue
            }
            visited[nx][ny] = true
            
            if map[nx][ny] > 0 && map[nx][ny] < size {
                fishes.append((nx, ny, nt))
            }
            
            queue.append((nx, ny, nt))
        }
    }
    
    if fishes.isEmpty {
        break
    }
    
    fishes.sort {
        $0.time != $1.time ?
            $0.time < $1.time :
            ($0.x != $1.x ? $0.x < $1.x : $0.y < $1.y)
    }
    
    let eattedFish = fishes.first!
    map[shark.x][shark.y] = 0
    
    shark.x = eattedFish.x
    shark.y = eattedFish.y
    shark.time = 0
    
    result += eattedFish.time
    eatCount += 1
    if eatCount == size {
        size += 1
        eatCount = 0
    }
}

print(result)
