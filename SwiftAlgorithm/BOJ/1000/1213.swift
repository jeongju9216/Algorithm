//
//  1213.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/01.
//

import Foundation

let input = Array(readLine()!).map { String($0) }

var dict: [String: Int] = [:]
for char in input {
    dict[char, default: 0] += 1
}

var odds: [String] = []
for (char, count) in dict {
    if count % 2 != 0 {
        odds.append(char)
    }
}

if odds.count > 1 {
    print("I'm Sorry Hansoo")
    exit(0)
}

var result = ""
if !odds.isEmpty {
    result = odds[0]
}

for str in dict.keys.sorted(by: >) {
    while dict[str]! >= 2 {
        result = str + result + str
        dict[str]! -= 2
    }
}

print(result)
