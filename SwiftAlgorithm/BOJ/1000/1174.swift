//
//  1174.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/02.
//

import Foundation

func dfs(_ current: Int) {
    if let num = Int(arr.joined()) {
        intSet.insert(num)
    }
    
    for i in 0..<10 where i < current {
        arr.append(String(i))
        dfs(i)
        arr.removeLast()
    }
}

let n = Int(readLine()!)!
var intSet: Set<Int> = []
var arr: [String] = []

dfs(10)

let result = intSet.sorted()

if n <= result.count {
    print(result[n-1])
} else {
    print("-1")
}
