//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/29.
//

import Foundation

let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }

let w = input[1], h = input[0]

var map: [[Int]] = []
for _ in 0..<h {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    map.append(input)
}

var safeArea: [(x: Int, y: Int)] = []
for i in 0..<h {
    for j in 0..<w {
        if map[i][j] == 0 {
            safeArea.append((i, j))
        }
    }
}

func findSafeArea(map: [[Int]]) -> Int {
    var map = map
    
    let dx: [Int] = [-1, 1, 0, 0]
    let dy: [Int] = [0, 0, -1, 1]
    
    var queue: [(x: Int, y: Int)] = []
    for i in 0..<h {
        for j in 0..<w {
            if map[i][j] == 2 {
                queue.append((i, j))
            }
        }
    }
    
    var index = 0
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nextX = node.x + dx[i]
            let nextY = node.y + dy[i]
            
            if nextX >= 0 && nextX < h && nextY >= 0 && nextY < w {
                if map[nextX][nextY] == 0 {
                    map[nextX][nextY] = 2
                    queue.append((nextX, nextY))
                }
            }
        }
    }

    var safeAreaCount = 0
    map.forEach {
        $0.forEach {
            if $0 == 0 {
                safeAreaCount += 1
            }
        }
    }

    return safeAreaCount
}

var result = 0
for i1 in 0..<safeArea.count {
    for i2 in (i1+1)..<safeArea.count {
        for i3 in (i2+1)..<safeArea.count {
            var map = map
            
            map[safeArea[i1].x][safeArea[i1].y] = 1
            map[safeArea[i2].x][safeArea[i2].y] = 1
            map[safeArea[i3].x][safeArea[i3].y] = 1
            
            let safeAreaCount = findSafeArea(map: map)
            result = max(result, safeAreaCount)
        }
    }
}

print(result)

