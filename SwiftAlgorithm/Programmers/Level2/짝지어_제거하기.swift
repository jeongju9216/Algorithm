//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/10.
//

import Foundation

func solution(_ s:String) -> Int{
    var stack: [Character] = []
    
    for letter in s {
        if let top = stack.last, top == letter {
            stack.popLast()
        } else {
            stack.append(letter)
        }
    }

    return stack.isEmpty ? 1 : 0
}
