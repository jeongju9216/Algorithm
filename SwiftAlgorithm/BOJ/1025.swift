//
//  1025.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/12.
//

import Foundation

func isSquare(_ num: Int) -> Bool {
    let root = Int(ceil(sqrt(Double(num))))
    return root * root == num
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    map.append(input)
}

var result = -1
for x in 0..<n {
    for y in 0..<m {
        for dx in (-n+1)..<n {
            for dy in (-m+1)..<m {
                if dx == 0 && dy == 0 {
                    if isSquare(map[x][y]) {
                        result = max(result, map[x][y])
                    }
                    
                    continue
                }
                
                var nx = x, ny = y
                var num = 0
                
                while (0..<n) ~= nx, (0..<m) ~= ny {
                    num *= 10
                    num += map[nx][ny]
                    
                    if isSquare(num) {
                        result = max(result, num)
                    }
                    
                    nx += dx
                    ny += dy
                }
            }
        }
    }
}

print(result)
