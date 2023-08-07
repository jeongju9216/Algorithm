//
//  13414.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/12.
//

import Foundation

let kl = readLine()!.split { $0 == " " }.map { Int($0)! }
let k = kl[0], l = kl[1]

var dict: [String: Int] = [:]
var count = 0
for _ in 0..<l {
    let input = readLine()!
    dict[input] = count
    count += 1
}

count = 0
for item in dict.keys.sorted { dict[$0]! < dict[$1]! } {
    print(item)
    count += 1
    if count == k {
        break
    }
}
