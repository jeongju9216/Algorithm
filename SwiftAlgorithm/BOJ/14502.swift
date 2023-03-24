//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/29.
//

import Foundation

typealias Point = (x: Int, y: Int)

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    map.append(input)
}

var safeAreas: [Point] = []
for i in 0..<n {
    for j in 0..<m {
        if map[i][j] == 0 {
            safeAreas.append((i, j))
        }
    }
}

func virus(_ map: [[Int]]) -> [[Int]] {
    var map = map
    var queue: [Point] = []
    var index = 0
    
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 2 {
                queue.append((i, j))
            }
        }
    }
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for k in 0..<4 {
            let nextX = node.x + dx[k]
            let nextY = node.y + dy[k]
            
            guard (0..<n) ~= nextX, (0..<m) ~= nextY else {
                continue
            }
            
            if map[nextX][nextY] == 0 {
                map[nextX][nextY] = 2
                queue.append((nextX, nextY))
            }
        }
    }
    
    return map
}

var result = 0
for i1 in 0..<safeAreas.count {
    for i2 in (i1+1)..<safeAreas.count {
        for i3 in (i2+1)..<safeAreas.count {
            var tmpMap = map
            tmpMap[safeAreas[i1].x][safeAreas[i1].y] = 1
            tmpMap[safeAreas[i2].x][safeAreas[i2].y] = 1
            tmpMap[safeAreas[i3].x][safeAreas[i3].y] = 1
            
            tmpMap = virus(tmpMap)
            
            var safeAreaCount = 0
            for i in 0..<n {
                for j in 0..<m {
                    if tmpMap[i][j] == 0 {
                        safeAreaCount += 1
                    }
                }
            }
            
            result = max(result, safeAreaCount)
        }
    }
}

print(result)
