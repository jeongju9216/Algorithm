//
//  13335.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/06/03.
//

import Foundation

let nwl = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nwl[0], w = nwl[1], l = nwl[2]

var trucks: [Int] = readLine()!.split { $0 == " " }.map { Int($0)! }.reversed()

var current = 0
var bridge = Array(repeating: 0, count: w)

var result = 0
while !trucks.isEmpty || current > 0 {
    result += 1
    
    if bridge[0] > 0 {
        current -= bridge[0]
    }
    
    if let last = trucks.last, current + last <= l {
        bridge.removeFirst()
        bridge.append(last)
        current += last
        trucks.removeLast()
    } else {
        bridge.remove(at: 0)
        bridge.append(0)
    }
}

print(result)
