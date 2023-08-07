//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/04.
//

//9935 문자열 폭발
import Foundation

let input = Array(readLine()!)
let keyword = readLine()!
let length = keyword.count

var stack: [Character] = []
for char in input {
    stack.append(char)
    
    while stack.count >= length,
          let last = keyword.last, last == char {
        let string = String(stack[(stack.count - length)...])
        if string == keyword {
            stack.removeLast(length)
        } else {
            break
        }
    }
}

let result = stack.isEmpty ? "FRULA" : String(stack)
print(result)
