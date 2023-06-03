//
//  2910.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/03.
//

import Foundation

let nc = readLine()!.split { $0 == " " }.map { Int($0)! }
let nums = readLine()!.split { $0 == " " }.map { Int($0)! }

var arr: [Int] = []
var dict: [Int: Int] = [:]

for num in nums {
    if let cnt = dict[num] {
        dict[num] = cnt + 1
    } else {
        arr.append(num)
        dict[num] = 1
    }
}

arr.sort { dict[$0]! > dict[$1]! }

for num in arr {
    for _ in 0..<dict[num]! {
        print("\(num)", terminator: " ")
    }
}
