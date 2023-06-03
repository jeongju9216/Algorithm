//
//  1439.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/17.
//

import Foundation

let arr = readLine()!.map { Int(String($0))! }

var dict: [Int: Int] = [0: 0, 1: 0]
for i in 0..<arr.count {
    if i == 0 {
        dict[arr[i]]! += 1
        continue
    }
    
    if arr[i-1] != arr[i] {
        dict[arr[i]]! += 1
    }
}

print(dict.values.min()!)
