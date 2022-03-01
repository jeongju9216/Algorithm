//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/01.
//

import Foundation


func solution(_ s:String) -> Bool
{
    var ans:Bool = false
    var stack: [Character] = []
    
    for letter in s {
        if letter == "(" {
            stack.append(letter)
        } else {
            if let top = stack.last, top == "(" {
                stack.popLast()
            } else {
                return false
            }
        }
    }
    
    ans = stack.isEmpty
    return ans
}

let s = "))(("
print(solution(s))
