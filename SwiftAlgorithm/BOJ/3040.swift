//
//  3040.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/18.
//

import Foundation

var arr: [Int] = []
for _ in 0..<9 {
    let input = Int(readLine()!)!
    arr.append(input)
}

let sum = arr.reduce(0, +)
var deleteIndex: [Int] = []
for i in 0..<9 where deleteIndex.isEmpty {
    for j in (i+1)..<9 {
        if sum - (arr[i] + arr[j]) == 100 {
            deleteIndex.append(i)
            deleteIndex.append(j)
            break
        }
    }
}

for i in 0..<9 where !deleteIndex.contains(i) {
    print("\(arr[i])")
}
