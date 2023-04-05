//
//  20115.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/05.
//

import Foundation

//양이 적은걸 먼저 합쳐야 함

let n = Int(readLine()!)!
let input = readLine()!.components(separatedBy: " ").map { Double($0)! }.sorted()

var result = input.last!
for i in 0..<input.count-1 {
    result += input[i] / 2.0
}

print(result)
