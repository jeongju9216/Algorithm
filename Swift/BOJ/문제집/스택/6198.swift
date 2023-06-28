//
//  6198.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/28.
//

import Foundation

let n = Int(readLine()!)!

var stack: [Int] = []
var result = 0
for _ in 0..<n {
    let num = Int(readLine()!)!
    
    while let top = stack.last, top <= num {
        stack.removeLast()
    }
    
    result += stack.count
    stack.append(num)
}

print(result)
