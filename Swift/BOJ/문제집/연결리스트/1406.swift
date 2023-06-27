//
//  1406.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/27.
//

import Foundation

var left = readLine()!
let m = Int(readLine()!)!
var right = ""

for _ in 0..<m {
    var command = readLine()!
    switch command {
    case "L":
        if !left.isEmpty {
            right.append(left.removeLast())
        }
    case "D":
        if !right.isEmpty {
            left.append(right.removeLast())
        }
    case "B":
        if !left.isEmpty {
            left.removeLast()
        }
    default:
        let value = String(command.last!)
        left.append(value)
    }
}

print(left + right.reversed())
