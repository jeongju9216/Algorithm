//
//  10816.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/08.
//

import Foundation

let n = Int(readLine()!)!
let cards = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let m = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var dict: [Int: Int] = [:]
for card in cards {
    dict[card, default: 0] += 1
}

var result: [Int] = []
for num in arr {
    result.append(dict[num] ?? 0)
}

result.forEach { print($0, terminator: " ") }
