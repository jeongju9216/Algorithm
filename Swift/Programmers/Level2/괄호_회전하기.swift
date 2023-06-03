//
//  괄호_회전하기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/03.
//

import Foundation

func isCorrectly(_ str: [Character]) -> Bool {
    let list: [Character: Character] = [")": "(", "]": "[", "}": "{"]
    var stack: [Character] = []
    
    for char in str {
        if list.keys.contains(char) {
            if let top = stack.last, top == list[char]! {
                stack.popLast()
            } else {
                return false
            }
        } else {
            stack.append(char)
        }
    }
    
    return stack.isEmpty
}

func solution(_ s:String) -> Int {
    var list: [Character] = Array(s)
    
    var count = 0
    (0..<s.count).forEach { _ in
        if isCorrectly(list) {
            count += 1
        }
        
        list.append(list.removeFirst())
    }
    
    return count
}
