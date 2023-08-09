//
//  1789.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/09.
//

import Foundation

let n = Int(readLine()!)!

var num = 0
var sum = 0
while sum < n {
    num += 1
    sum += num
}

if sum == n {
    print(num)
} else {
    print(num - 1)
}
