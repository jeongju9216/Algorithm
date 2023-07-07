//
//  9012.swift
//  Algorithm
//
//  Created by 유정주 on 2023/07/07.
//

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let arr = Array(readLine()!)
    
    var result = true
    var stack: [Character] = []
    for char in arr {
        if char == "(" {
            stack.append(char)
        } else {
            if let top = stack.last, top == "(" {
                stack.removeLast()
            } else {
                result = false
                break
            }
        }
    }
    
    if stack.isEmpty && result {
        print("YES")
    } else {
        print("NO")
    }
}
