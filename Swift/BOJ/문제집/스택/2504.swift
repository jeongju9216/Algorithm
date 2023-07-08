//
//  2504.swift
//  Algorithm
//
//  Created by 유정주 on 2023/07/08.
//

import Foundation

let arr = Array(readLine()!)

var dict: [Character: Int] = ["(": 2, "[": 3]
var tmp = 1, result = 0
var stack: [Character] = []
var isError = false
for i in 0..<arr.count {
    let char = arr[i]
    if char == "(" || char == "[" {
        tmp *= dict[char]!
        stack.append(char)
    } else {
        guard let top = stack.last else {
            isError = true
            break
        }
        
        if (char == ")" && top == "(") || (char == "]" && top == "[") {
            stack.removeLast()
            if arr[i-1] == top {
                result += tmp
            }
            tmp /= dict[top]!
        } else {
            isError = true
            break
        }
    }
}

if !stack.isEmpty || isError {
    print("0")
} else {
    print(result)
}
