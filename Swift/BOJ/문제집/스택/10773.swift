//
//  10773.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/28.
//

import Foundation

let k = Int(readLine()!)!
var stack: [Int] = []
for _ in 0..<k {
    let num = Int(readLine()!)!
    if num == 0 {
        stack.removeLast()
    } else {
        stack.append(num)
    }
}

let result = stack.reduce(0, +)
print(result)
