//
//  17413.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/25.
//

import Foundation

let input = Array(readLine()!)
var stack: [Character] = []
var result = "", isOpenTag = false
for char in input {
    if isOpenTag && char != ">" {
        stack.append(char)
        continue
    }
    
    if char == "<" {
        if !stack.isEmpty {
            result += String(stack.reversed())
            stack = []
        }
        
        isOpenTag = true
        stack.append(char)
    } else if char == ">" {
        isOpenTag = false
        
        result += String(stack)
        result += String(char)
        stack = []
    } else if char == " " {
        result += String(stack.reversed())
        result += String(char)
        stack = []
    } else {
        stack.append(char)
    }
}
if !stack.isEmpty {
    result += String(stack.reversed())
}

print(result)
