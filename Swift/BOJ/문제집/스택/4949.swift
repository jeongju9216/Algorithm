//
//  4949.swift
//  Algorithm
//
//  Created by 유정주 on 2023/07/04.
//

import Foundation

let dict: [Character: Character] = [")": "(", "]": "["]

while let string = readLine(), string != "." {
    var stack: [Character] = []
    var isBalance = true
    
    let arr = string.filter { ["(", ")", "[", "]"].contains($0) }
    for char in arr {
        if char == "(" || char == "[" {
            stack.append(char)
        } else {
            guard let top = stack.last else {
                isBalance = false
                break
            }
            
            if let key = dict[char], key == top {
                stack.removeLast()
            } else {
                isBalance = false
                break
            }
        }
    }
    
    if !stack.isEmpty {
        isBalance = false
    }
    
    if isBalance {
        print("yes")
    } else {
        print("no")
    }
}
