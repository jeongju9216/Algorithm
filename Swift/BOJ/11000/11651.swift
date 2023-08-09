//
//  11651.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/09.
//

import Foundation

let n = Int(readLine()!)!
var arr: [(x: Int, y: Int)] = []
for _ in 0..<n {
    let line = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    arr.append((line[0], line[1]))
}

print(
    arr.sorted { $0.y != $1.y ? $0.y < $1.y : $0.x < $1.x }
        .map { "\($0.x) \($0.y)" }
        .joined(separator: "\n")
)
