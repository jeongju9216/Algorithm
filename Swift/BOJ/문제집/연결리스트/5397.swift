//
//  5397.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/27.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let str = readLine()!
    var left = "", right = ""
    
    str.forEach {
        switch $0 {
        case "<":
            if !left.isEmpty {
                right.append(left.removeLast())
            }
        case ">":
            if !right.isEmpty {
                left.append(right.removeLast())
            }
        case "-":
            if !left.isEmpty {
                left.removeLast()
            }
        default:
            left.append(String($0))
        }
    }
    
    print(left + right.reversed())
}
