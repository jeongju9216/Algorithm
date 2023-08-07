//
//  4673.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/07.
//

import Foundation

func selfNumber(_ num: Int) -> Int {
    let nums = String(num).map { Int(String($0))! }
    return num + nums.reduce(0, +)
}

var visited = Array(repeating: false, count: 10001)
for i in 1...10000 {
    let selfNumber = selfNumber(i)
    if selfNumber <= 10000 {
        visited[selfNumber] = true
    }
}

for i in 1...10000 where !visited[i] {
    print(i)
}
