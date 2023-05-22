//
//  2630.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/22.
//

import Foundation

func quard(_ size: Int, _ x: Int, _ y: Int) {
    let half = size / 2
    let item = map[x][y]
    
    var canPaper = true
    
    for i in x..<x+size where canPaper {
        for j in y..<y+size {
            if map[i][j] != item {
                canPaper = false
                break
            }
        }
    }
    
    if canPaper {
        result[item] += 1
    } else {
        quard(half, x, y)
        quard(half, x + half, y)
        quard(half, x, y + half)
        quard(half, x + half, y + half)
    }
}

let n = Int(readLine()!)!

var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    map.append(input)
}

var result: [Int] = [0, 0]

quard(n, 0, 0)

print(result[0])
print(result[1])
