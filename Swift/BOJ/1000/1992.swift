//
//  1992.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/17.
//

import Foundation

//나눠지면 괄호 추가

func quard(_ n: Int, _ x: Int, _ y: Int) {
    let item = map[x][y]
    
    guard n > 1 else {
        result += "\(item)"
        return
    }
    
    let half = n / 2
    var isSame = true
    
    for i in x..<x+n where isSame {
        for j in y..<y+n {
            if map[i][j] != item {
                isSame = false
                break
            }
        }
    }
    
    if isSame {
        result += "\(item)"
        return
    }
    
    result += "("
    quard(half, x, y)
    quard(half, x, y + half)
    quard(half, x + half, y)
    quard(half, x + half, y + half)
    result += ")"
}

let n = Int(readLine()!)!

var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    map.append(input)
}

var result = ""
quard(n, 0, 0)

print(result)
