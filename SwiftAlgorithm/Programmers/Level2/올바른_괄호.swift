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
    var stack: [String] = []
    
    s.forEach {
        if $0 == "(" {
            stack.append(String($0))
        } else {
            if let top = stack.last, top == "(" {
                stack.popLast()
            } else {
                stack.append(String($0))
            }
        }
    }
    
    ans = stack.isEmpty
    return ans
}

let s = "(())))"
print(solution(s))
