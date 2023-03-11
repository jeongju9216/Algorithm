//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/15.
//

//2217 로프
import Foundation

let count = Int(readLine()!)!
var ropes: [Int] = []
for _ in 0..<count {
    let input = Int(readLine()!)!
    ropes.append(input)
}
ropes.sort(by: >)

var result = 0
for i in 0..<count {
    result = max(result, ropes[i] * (i+1))
}

print(result)
