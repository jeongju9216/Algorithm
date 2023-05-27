//
//  2346.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/10.
//

import Foundation

let n = Int(readLine()!)!
var input = readLine()!.components(separatedBy: " ").map { Int($0)! }
var dq: [(balloon: Int, item: Int)] = Array(1...n).map { ($0, input[$0-1]) }

var popItem = dq.removeFirst()
var index = 0
var result: [Int] = [popItem.balloon]

while !dq.isEmpty {
    if popItem.item > 0 {
        index = (index + popItem.item - 1) % dq.count
    } else {
        index = (index + popItem.item) % dq.count
    }
    
    if index < 0 {
        index += dq.count
    }
    
    popItem = dq.remove(at: index)
    result.append(popItem.balloon)
}

print(result.map { String($0) }.joined(separator: " "))
