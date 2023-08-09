//
//  1094.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/09.
//

import Foundation

let x = Int(readLine()!)!
var arr = [64]

while true {
    let sum = arr.reduce(0, +)
    if sum == x {
        break
    }
        
    let minItem = arr.removeLast()
    let half = minItem / 2
    if sum - minItem + half >= x {
        arr += [half]
    } else {
        arr += [half, half]
    }
}

print(arr.count)
