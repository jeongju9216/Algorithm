//
//  5212.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/28.
//

import Foundation

typealias Point = (x: Int, y: Int)
let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

let rc = readLine()!.components(separatedBy: " ").map { Int($0)! }
let r = rc[0], c = rc[1]
var map: [[String]] = []
for _ in 0..<r {
    let input = Array(readLine()!).map { String($0) }
    map.append(input)
}

var tmpMap = map
var groundR: [Int] = []
var groundC: [Int] = []
for i in 0..<r {
    for j in 0..<c {
        if map[i][j] == "X" {
            var count = 0
            for k in 0..<4 {
                let nextX = i + dx[k]
                let nextY = j + dy[k]
                
                guard (0..<r) ~= nextX, (0..<c) ~= nextY else {
                    count += 1
                    continue
                }
                
                if map[nextX][nextY] == "." {
                    count += 1
                }
            }
            
            if count < 3 {
                groundR.append(i)
                groundC.append(j)
            } else {
                tmpMap[i][j] = "."
            }
        }
    }
}

map = tmpMap

for i in groundR.min()!...groundR.max()! {
    for j in groundC.min()!...groundC.max()! {
        print(map[i][j], terminator: "")
    }
    print("")
}
