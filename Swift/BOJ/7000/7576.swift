//
//  7576.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/01.
//

//7576 토마토
import Foundation

typealias Point = (x: Int, y: Int, cnt: Int)
let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

func bfs(_ start: [Point]) {
    var queue = start
    var index = 0
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = node.x + dx[i]
            let ny = node.y + dy[i]
            let nd = node.cnt + 1
            
            guard (0..<n) ~= nx, (0..<m) ~= ny, map[nx][ny] == 0 else {
                continue
            }
            
            map[nx][ny] = 1
            tomatoCount += 1
            queue.append((nx, ny, nd))
            
            result = nd
        }
    }
}

let mn = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let m = mn[0], n = mn[1]

var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    map.append(input)
}

var tomatoCount = 0, totalCount = n * m
var starts: [Point] = []

for i in 0..<n {
    for j in 0..<m {
        if map[i][j] == 1 {
            tomatoCount += 1
            starts.append((i, j, 0))
        }
        
        if map[i][j] == -1 {
            totalCount -= 1
        }
    }
}

var result = 0
bfs(starts)

if totalCount != tomatoCount {
    print("-1")
} else {
    print(result)
}
