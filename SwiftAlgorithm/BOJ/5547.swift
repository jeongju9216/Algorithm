//
//  5547.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/11.
//

import Foundation

//6면 체크
//6면 다 벽이라면 pass
//1을 기준으로 탐색해서 0이 됐을 때 +1
//1 ~ 5일 때 result에 카운팅
//범위를 벗어나면 result에 카운팅

typealias Point = (x: Int, y: Int)

let dx = [[-1, 0, 1, 1, 0, -1], [-1, 0, 1, 1, 0, -1]]
let dy = [[0, 1, 0, -1, -1, -1], [1, 1, 1, 0, -1, 0]]

func bfs(_ start: Point) {
    var queue = [start]
    var index = 0
    visited[start.x] [start.y] = true
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for i in 0..<6 {
            let isEven = node.x % 2
            let nx = node.x + dx[isEven][i]
            let ny = node.y + dy[isEven][i]
            
            guard (0..<h) ~= nx, (0..<w) ~= ny, !visited[nx][ny] else {
                continue
            }
            
            if map[nx][ny] == 1 {
                result += 1
            } else {
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
}

let wh = readLine()!.split { $0 == " " }.map { Int($0)! }
var w = wh[0] + 2, h = wh[1] + 2

var map: [[Int]] = []
map.append(Array(repeating: 0, count: w))
for _ in 0..<h-2 {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    map.append([0] + input + [0])
}
map.append(Array(repeating: 0, count: w))

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: w), count: h)
var result = 0
bfs((0, 0))

print(result)
