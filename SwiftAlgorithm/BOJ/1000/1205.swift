//
//  1205.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/12.
//

import Foundation

let nmp = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nmp[0], m = nmp[1], p = nmp[2]
if n == 0 {
    print("1")
    exit(0)
}

let arr = readLine()!.components(separatedBy: " ").map { Int($0)! }

if n == p && m <= arr.last! {
    print(-1)
    exit(0)
}

var rank = 1
for score in arr {
    if score > m {
        rank += 1
    }
}

print(rank)
