//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/03.
//

import Foundation

func isVPS(_ string: [String]) -> Bool {
    var stack: [String] = []
    for str in string {
        if str == "(" {
            stack.append(str)
        } else {
            guard let last = stack.popLast() else {
                return false
            }
            
            if last != "(" {
                return false
            }
        }
    }
    
    return stack.isEmpty
}

var count = Int(readLine()!)!
for _ in 0..<count {
    let input = Array(readLine()!).map { String($0) }
    
    if isVPS(input) {
        print("YES")
    } else {
        print("NO")
    }
}
