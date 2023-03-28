//
//  16231.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/26.
//

import Foundation

typealias Point = (x: Int, y: Int, count: Int)

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]
func bfs(_ start: Point) -> Bool {
    visited[start.x][start.y] = true
    var sum = 0
    
    var queue: [Point] = [start]
    var index = 0

    while index < queue.count {
        let node = queue[index]
        index += 1
        
        sum += node.count
        
        for i in 0..<4 {
            let nextX = node.x + dx[i]
            let nextY = node.y + dy[i]
            
            guard range ~= nextX, range ~= nextY,
                    !visited[nextX][nextY] else {
                continue
            }
            
            let diff = abs(node.count - map[nextX][nextY])
            if diff >= l && diff <= r {
                queue.append((nextX, nextY, map[nextX][nextY]))
                visited[nextX][nextY] = true
            }
        }
    }
    
    let afterCount = Int(floor(Double(sum) / Double(queue.count)))
    for point in queue {
        map[point.x][point.y] = afterCount
    }
    
    return queue.count > 1
}


let nlr = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nlr[0], l = nlr[1], r = nlr[2]
let range = (0..<n)
var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    map.append(input)
}

var result = 0
var visited: [[Bool]] = []
while true {
    var isCombine = false
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] {
                isCombine = bfs((i, j, map[i][j])) || isCombine
            }
        }
    }
    
    if isCombine {
        result += 1
    } else {
        break
    }
}

print(result)

