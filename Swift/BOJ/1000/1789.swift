//
//  1789.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/18.
//

import Foundation

let s = Int(readLine()!)!

var sum = 0, count = 0
while sum < s {
    count += 1
    sum += count
}

if sum == s {
    print(count)
} else {
    print(count - 1)
}

