//
//  2504.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/19.
//

import Foundation

let input = Array(readLine()!)

var stack: [Character] = []
var tmp = 1
var result = 0
for i in 0..<input.count {
    let char = input[i]
    if char == "(" || char == "[" {
        if char == "(" {
            tmp *= 2
        } else {
            tmp *= 3
        }
        
        stack.append(char)
    } else {
        guard let last = stack.last else {
            result = -1
            break
        }
        
        if last == "(" && char == ")" {
            stack.removeLast()
            if input[i-1] == "(" {
                result += tmp
            }
            tmp /= 2
        } else if last == "[" && char == "]" {
            stack.removeLast()
            if input[i-1] == "[" {
                result += tmp
            }
            tmp /= 3
        } else {
            result = -1
            break
        }
    }
}

if result == -1 || !stack.isEmpty {
    print(0)
} else {
    print(result)
}

