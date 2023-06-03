//
//  1302.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/20.
//

import Foundation

let count = Int(readLine()!)!
var dict: [String: Int] = [:]
for _ in 0..<count {
    let input = readLine()!
    dict[input, default: 0] += 1
}

let titles: [String] = dict.keys.sorted {
    if dict[$0]! != dict[$1]! {
        return dict[$0]! > dict[$1]!
    } else {
        return $0 < $1
    }
}

print(titles.first!)
