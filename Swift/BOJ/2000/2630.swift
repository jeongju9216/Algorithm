//
//  2630.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/09.
//

import Foundation

func quard(_ x: Int, _ y: Int, _ size: Int) {
    let half = size / 2
    var item = map[x][y]
    var isQuard = false
    for i in x..<x+size {
        for j in y..<y+size {
            guard item != map[i][j] else {
                continue
            }
            
            quard(x, y, half)
            quard(x + half, y, half)
            quard(x, y + half, half)
            quard(x + half, y + half, half)
            return
        }
    }

    if item == 1 {
        blue += 1
    } else {
        white += 1
    }
}

let n = Int(readLine()!)!
var map: [[Int]] = []
for _ in 0..<n {
    map.append(readLine()!.split { $0 == " " }.map { Int(String($0))! })
}

var blue = 0, white = 0
quard(0, 0, n)
print(white)
print(blue)
