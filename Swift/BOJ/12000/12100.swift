//
//  12100.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/24.
//

import Foundation

func printMap(_ map: [[Int]]) {
    print("====")
    for line in map {
        print(line)
    }
}

enum Direction: CaseIterable {
    case up, down, left, right
}

let n = Int(readLine()!)!
var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    map.append(input)
}

var result = 0

func dfs(_ count: Int, _ direction: Direction, _ map: [[Int]]) {
    guard count < 5 else {
        return
    }
    
    var map = map
    for i in 0..<n {
        var newLine: [Int] = []
        switch direction {
        case .up, .down:
            newLine = map.map { $0[i] }.filter { $0 != 0 }
        case .left, .right:
            newLine = map[i].filter { $0 != 0 }
        }
        
        guard !newLine.isEmpty else {
            continue
        }
        
        let length = newLine.count
        for j in 1..<length {
            switch direction {
            case .up, .left:
                if newLine[j] == newLine[j-1] {
                    newLine[j-1] *= 2
                    newLine[j] = -1
                }
            case .down, .right:
                if newLine[length-j] == newLine[length-j-1] {
                    newLine[length-j] *= 2
                    newLine[length-j-1] = -1
                }
            }
        }
        newLine = newLine.filter { $0 != -1 }
        
        switch direction {
        case .up, .left:
            newLine = newLine + Array(repeating: 0, count: n - newLine.count)
        case .down, .right:
            newLine = Array(repeating: 0, count: n - newLine.count) + newLine
        }
        
        for j in 0..<n {
            switch direction {
            case .up, .down:
                map[j][i] = newLine[j]
            case .left, .right:
                map[i][j] = newLine[j]
            }
        }
        
        result = max(result, newLine.max() ?? 0)
    }
    
    for direction in Direction.allCases {
        dfs(count + 1, direction, map)
    }
}

for direction in Direction.allCases {
    dfs(0, direction, map)
}

print(result)
