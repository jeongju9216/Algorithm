//
//  20.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/02.
//

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        var dict: [Character: Character] = [")":"(", "}":"{", "]":"["]
        var stack: [Character] = []
        
        for char in s {
            if char == "(" || char == "{" || char == "[" {
                stack.append(char)
            } else {
                if let top = stack.last, top == dict[char]! {
                    stack.removeLast()
                } else {
                    stack.append(char)
                    break
                }
            }
        }
        
        return stack.isEmpty
    }
}
