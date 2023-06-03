//
//  2638.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/08.
//

import Foundation

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    map.append(input)
}

var result = 0
var isMelting = true
while isMelting {
    isMelting = false
    
    //맨 가장자리는 치즈가 없기 때문에 0,0에서 bfs로 돌면서 치즈와 접촉하면 +1 해준다
    //visited가 2 이상이 되면 녹인다
    var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    var queue: [(x: Int, y: Int)] = [(0, 0)]
    var index = 0
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = node.x + dx[i]
            let ny = node.y + dy[i]
            
            guard (0..<n) ~= nx, (0..<m) ~= ny else {
                continue
            }
            
            visited[nx][ny] += 1
            if map[nx][ny] == 0 && visited[nx][ny] == 1 {
                queue.append((nx, ny))
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 1 && visited[i][j] >= 2 {
                map[i][j] = 0
                isMelting = true
            }
        }
    }
    
    if !isMelting {
        break
    }
    
    result += 1
}

print(result)

