//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/12.
//

//1931 회의실 배정
import Foundation

let count = Int(readLine()!)!
var times: [(Int, Int)] = []
for _ in 0..<count {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    times.append((input[0], input[1]))
}

times.sort { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 }

var result = 0
var endTime = -1
for time in times {
    if endTime <= time.0 {
        result += 1
        endTime = time.1
    }
}

print(result)
