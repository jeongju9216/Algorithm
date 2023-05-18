//
//  11651.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/18.
//

import Foundation

let n = Int(readLine()!)!
var arr: [(x: Int, y: Int)] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    arr.append((input[0], input[1]))
}

arr.sort { $0.y != $1.y ? $0.y < $1.y : $0.x < $1.x }

for item in arr {
    print("\(item.x) \(item.y)")
}
