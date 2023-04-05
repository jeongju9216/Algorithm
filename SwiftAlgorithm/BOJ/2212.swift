//
//  2212.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/05.
//

import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!

let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }.sorted()

if input.count <= k {
    print("0")
    exit(0)
}

var diffs: [Int] = []
for i in 1..<input.count {
    diffs.append(input[i] - input[i-1])
}

diffs.sort(by: >)

var result = 0
for i in k-1..<diffs.count {
    result += diffs[i]
}

print(result)
