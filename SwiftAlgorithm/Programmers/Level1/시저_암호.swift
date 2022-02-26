//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/26.
//

import Foundation

func solution(_ s:String, _ n:Int) -> String {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    
    let result = s.map { s->Character in
        if s == " " {
            return s
        } else {
            let index = alphabet.firstIndex(of: Character(s.lowercased()))! + n
            let char = alphabet[index%26]
            return s.isLowercase ? char : Character(char.uppercased())
        }
    }
        
    return String(result)
}

let s = "AB"
let n = 1
print(solution(s, n))
