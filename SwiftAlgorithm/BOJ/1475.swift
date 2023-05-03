//
//  1475.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/03.
//

import Foundation

let n = Array(readLine()!).map { Int(String($0))! }
var dict: [Int: Int] = [:]
for i in 0...9 {
    dict[i] = 0
}

for num in n {
    if num == 6 {
        if dict[6]! <= dict[9]! {
            dict[6]! += 1
        } else {
            dict[9]! += 1
        }
    } else if num == 9 {
        if dict[9]! <= dict[6]! {
            dict[9]! += 1
        } else {
            dict[6]! += 1
        }
    } else {
        dict[num]! += 1
    }
}

print(dict.values.max()!)
