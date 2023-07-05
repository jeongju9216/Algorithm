//
//  3986.swift
//  Algorithm
//
//  Created by 유정주 on 2023/07/05.
//

import Foundation

let n = Int(readLine()!)!
var result = 0
for _ in 0..<n {
    let str = readLine()!
    
    var stack: [Character] = []
    for char in str {
        if stack.isEmpty {
            stack.append(char)
            continue
        }
        
        if let top = stack.last, top == char {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    
    if stack.isEmpty {
        result += 1
    }
}

print(result)
