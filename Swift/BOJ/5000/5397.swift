//
//  5397.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/20.
//

import Foundation

let count = Int(readLine()!)!
for _ in 0..<count {
    let input = Array(readLine()!).map { String($0) }
    
    var stack: [String] = []
    var tmp: [String] = []
    for str in input {
        switch str {
        case "<":
            if let last = stack.popLast() {
                tmp.append(last)
            }
        case ">":
            if let last = tmp.popLast() {
                stack.append(last)
            }
        case "-":
            stack.popLast()
        default:
            stack.append(str)
        }
    }
    
    stack.append(contentsOf: tmp.reversed())
    
    print(stack.joined())
}
