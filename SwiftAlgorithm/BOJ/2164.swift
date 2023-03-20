//
//  2164.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/20.
//

import Foundation

let input = Int(readLine()!)!
var queue: [Int] = Array(1...input)
var index = 0
while index + 1 < queue.count {
    index += 1
    queue.append(queue[index])
    index += 1
}

print(queue[index])
