//
//  11659.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/14.
//

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nm[0], m = nm[1]

var arr = readLine()!.split { $0 == " " }.map { Int($0)! }
var sums = [0, arr[0]]
for i in 1..<n {
    sums.append(sums[i] + arr[i])
}

for _ in 0..<m {
    let range = readLine()!.split { $0 == " " }.map { Int($0)! }
    let start = range[0], end = range[1]
        
    print(sums[end] - sums[start-1])
}
