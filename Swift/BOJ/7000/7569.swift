//
//  7569.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/11.
//

import Foundation

typealias Point = (x: Int, y: Int, z: Int, cnt: Int)

let dx = [-1, 1, 0, 0, 0, 0], dy = [0, 0, -1, 1, 0, 0]
let dz = [0, 0, 0, 0, -1, 1]

func bfs(_ start: [Point]) {
    var queue = start
    var index = 0
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for i in 0..<6 {
            let nx = node.x + dx[i]
            let ny = node.y + dy[i]
            let nz = node.z + dz[i]
            
            guard (0..<h) ~= nz, (0..<n) ~= nx, (0..<m) ~= ny, map[nz][nx][ny] == 0 else {
                continue
            }
            
            let nd = node.cnt + 1
            map[nz][nx][ny] = 1
            tomato += 1
            
            result = nd
            queue.append((nx, ny, nz, nd))
        }
    }
}

let mnh = readLine()!.split { $0 == " " }.map { Int($0)! }
let m = mnh[0], n = mnh[1], h = mnh[2]
var map: [[[Int]]] = []
for _ in 0..<h {
    var arr: [[Int]] = []
    for _ in 0..<n {
        arr.append(readLine()!.split { $0 == " " }.map { Int($0)! })
    }
    map.append(arr)
}

var start: [Point] = []
var total = m * n * h
var tomato = 0
for i in 0..<h {
    for j in 0..<n {
        for k in 0..<m {
            if map[i][j][k] == 1 {
                tomato += 1
                start.append((j, k, i, 0))
            }
            
            if map[i][j][k] == -1 {
                total -= 1
            }
        }
    }
}

if tomato == total {
    print("0")
    exit(0)
}

var result = 0
bfs(start)

if total == tomato {
    print(result)
} else {
    print("-1")
}
