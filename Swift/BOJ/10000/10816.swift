//
//  10816.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/17.
//

import Foundation

let n = Int(readLine()!)!
let cards = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted()
let m = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int($0)! }

var dict: [Int: Int] = [:]
for card in cards {
    dict[card, default: 0] += 1
}

var result: [Int] = []
for num in arr {
    result.append(dict[num] ?? 0)
}

for num in result {
    print(num, terminator: " ")
}
