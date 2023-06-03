//
//  11508.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/05.
//

import Foundation

//비싼걸 묶어서 사야됨

let n = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

arr.sort(by: >)

var sum = 0
for i in 1...arr.count {
    if i % 3 != 0 {
        sum += arr[i-1]
    }
}

print(sum)
