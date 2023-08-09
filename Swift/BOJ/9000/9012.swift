//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/09.
//

import Foundation

func isVPS(_ string: [String]) -> Bool {
    var stack: [String] = []
    for str in string {
        if str == "(" {
            stack.append(str)
        } else {
            guard let last = stack.last, last == "(" else {
                return false
            }
            stack.removeLast()
        }
    }
    
    return stack.isEmpty
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let input = Array(readLine()!).map { String($0) }
    print(isVPS(input) ? "YES" : "NO")
}
