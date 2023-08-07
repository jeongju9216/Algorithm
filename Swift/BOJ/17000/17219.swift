//
//  17219.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/13.
//

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nm[0], m = nm[1]

var dict: [String: String] = [:]
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { String($0) }
    dict[input[0]] = input[1]
}

for _ in 0..<m {
    let input = readLine()!
    print(dict[input]!)
}
