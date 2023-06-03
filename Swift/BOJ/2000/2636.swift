//
//  2636.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/06/03.
//

import Foundation

typealias Node = (x: Int, y: Int)
let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

let hw = readLine()!.components(separatedBy: " ").map { Int($0)! }
let h = hw[0], w = hw[1]

var map: [[Int]] = []
var total = 0
for _ in 0..<h {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    map.append(input)
    
    total += input.filter { $0 == 1 }.count
}

var time = 0, prev = 0
repeat {
    time += 1
    prev = total
    
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: w), count: h)
    var tmpMap = map
    
    var queue: [Node] = [(0, 0)]
    var index = 0
    
    visited[0][0] = true
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = node.x + dx[i]
            let ny = node.y + dy[i]
            
            guard (0..<h) ~= nx, (0..<w) ~= ny, !visited[nx][ny] else {
                continue
            }
            
            visited[nx][ny] = true
            if tmpMap[nx][ny] == 1 {
                map[nx][ny] = 0
                total -= 1
            } else {
                queue.append((nx, ny))
            }
        }
    }
} while total > 0

print(time)
print(prev)
