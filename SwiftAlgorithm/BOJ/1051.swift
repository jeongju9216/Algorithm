//
//  1051.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/07.
//

import Foundation

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    map.append(input)
}

var length = min(n, m) + 1
var result = 0
var canMake = false
repeat {
    length -= 1
    canMake = false
    
    for i in 0..<n where !canMake {
        for j in 0..<m where !canMake {
            guard 0..<n ~= i+length, 0..<m ~= j+length else {
                continue
            }
            
            let v1 = map[i][j]
            let v2 = map[i][j+length]
            let v3 = map[i+length][j]
            let v4 = map[i+length][j+length]
            
            if v1 == v2 && v2 == v3 && v3 == v4 {
                canMake = true
                break
            }
        }
    }
    
} while !canMake

print((length + 1) * (length + 1))
