//
//  1449.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/20.
//

import Foundation

//현재 구멍 + 테이프 길이 - 1까지 커버 가능

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
var holes = readLine()!.components(separatedBy: " ").map { Int($0)! }
holes.sort()

var tapeLength = input[1]
var currentTape = 0, tapeCount = 0
for hole in holes {
    //커버 못하면 테이프 뜯음
    if currentTape < hole {
        currentTape = hole + tapeLength - 1
        tapeCount += 1
    }
}

print(tapeCount)

