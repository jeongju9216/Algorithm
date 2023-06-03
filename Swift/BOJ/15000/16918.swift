//
//  16918.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/15.
//

import Foundation

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

func installBomb(time: Int) {
    for i in 0..<r {
        for j in 0..<c {
            if map[i][j] == "O" {
                continue
            }
            
            map[i][j] = "O"
            bombTimes[i][j] = time + 3
        }
    }
}

func bomb(time: Int) {
    for i in 0..<r {
        for j in 0..<c {
            if bombTimes[i][j] == time {
                for k in 0..<4 {
                    let nx = i + dx[k]
                    let ny = j + dy[k]
                    
                    guard (0..<r) ~= nx, (0..<c) ~= ny else {
                        continue
                    }
                    
                    map[nx][ny] = "."
                }
                
                map[i][j] = "."
                bombTimes[i][j] = 0
            }
        }
    }
}

func printMap() {
    for line in map {
        for str in line {
            print(str, terminator: "")
        }
        print("")
    }
}

let rcn = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (r, c, n) = (rcn[0], rcn[1], rcn[2])

var map: [[String]] = []
var bombTimes: [[Int]] = Array(repeating: Array(repeating: 0, count: c), count: r)
for i in 0..<r {
    let input = Array(readLine()!).map { String($0) }
    map.append(input)
    
    for j in 0..<c where input[j] == "O" {
        bombTimes[i][j] = 3
    }
}

if n >= 2 {
    for time in 2...n {
        if time % 2 == 0 {
            installBomb(time: time)
        } else {
            bomb(time: time)
        }
    }
}

printMap()
