//
//  17276.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/26.
//

import Foundation

func printMap(_ map: [[Int]]) {
    for line in map {
        for number in line {
            print(number, terminator: " ")
        }
        print("")
    }
}

func spin(_ map: inout [[Int]]) {
    let tmp = map.enumerated().map { $0.element[$0.offset] }
    let n = tmp.count
    let half = Int(floor(Double(n) / 2.0))
    
    for i in 0..<tmp.count {
        map[i][i] = map[half][i]
    }
    
    for i in 0..<tmp.count {
        map[half][i] = map[n-1-i][i]
    }
    
    for i in 0..<tmp.count {
        map[n-i-1][i] = map[n-1-i][half]
    }
    
    for i in 0..<tmp.count {
        map[i][half] = tmp[i]
    }
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let n = input[0]
    var d = input[1]
    if d < 0 {
        d = 360 + d
    }
    
    var map: [[Int]] = []
    for _ in 0..<n {
        let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
        map.append(input)
    }

    if d == 0 || d == 360 {
        printMap(map)
        continue
    }
    
    let turnCount = abs(d) / 45
    for _ in 0..<turnCount {
        spin(&map)
    }
    
    printMap(map)
}
