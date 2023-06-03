//
//  1374.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/16.
//

import Foundation

typealias Item = (time: Int, isStart: Int)

let n = Int(readLine()!)!
var arr: [Item] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    arr.append((input[1], 1))
    arr.append((input[2], -1))
}

arr.sort {
    if $0.time != $1.time {
        return $0.time < $1.time
    } else {
        return $0.isStart < $1.isStart
    }
}

var count = 0, result = 0
for i in 0..<arr.count {
    count += arr[i].isStart
    
    result = max(result, count)
}

print(result)
