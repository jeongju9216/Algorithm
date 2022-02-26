//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/27.
//

import Foundation

func solution(_ s:String) -> String {
    var result = ""
    
    var count = 0
    for letter in s {
        if letter == " " {
            result += String(letter)
            count = 0
        } else {
            if count % 2 == 0 {
                result += letter.uppercased()
            } else {
                result += letter.lowercased()
            }
            count += 1
        }
    }
    
    return result
}

let s = "try hello world"
print(solution(s))
