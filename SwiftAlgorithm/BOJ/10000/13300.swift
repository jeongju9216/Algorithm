//
//  13300.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/26.
//

import Foundation

let nk = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: 7)
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    arr[input[1]][input[0]] += 1
}

var result = 0
for classNum in arr {
    let woman = classNum[0]
    let man = classNum[1]
    
    result += Int(ceil(Double(woman) / Double(k)))
    result += Int(ceil(Double(man) / Double(k)))
}

print(result)
