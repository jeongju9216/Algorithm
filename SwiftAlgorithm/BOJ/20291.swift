//
//  20291.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/26.
//

import Foundation

let n = Int(readLine()!)!
var dict: [String: Int] = [:]
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: ".").last!
    dict[input, default: 0] += 1
}

let result = dict.keys.sorted()
for key in result {
    print("\(key) \(dict[key]!)")
}
