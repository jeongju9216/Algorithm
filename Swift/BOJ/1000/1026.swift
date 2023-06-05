//
//  1026.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/05.
//

import Foundation

let n = Int(readLine()!)!
let listA = readLine()!.split { $0 == " " }.map { Int(String($0))! }.sorted()
let listB = readLine()!.split { $0 == " " }.map { Int(String($0))! }.sorted(by: >)

var result = 0
for i in 0..<listA.count {
    result += listA[i] * listB[i]
}

print(result)
