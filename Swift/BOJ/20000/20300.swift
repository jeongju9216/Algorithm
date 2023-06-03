//
//  20300.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/05.
//

import Foundation

//가장 큰거는 하나 쓸 때 쓰기
//짝수면 평균으로

let n = Int(readLine()!)!
var input = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()

var result = 0
if n % 2 == 0 {
    for i in 0..<n/2 {
        result = max(result, input[i] + input[n-i-1])
    }
} else {
    result = input.popLast()!
    for i in 0..<input.count/2 {
        result = max(result, input[i] + input[input.count-i-1])
    }
}

print(result)
