//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/20.
//

import Foundation

let input = Array(readLine()!).map { String($0) }
var result: [String] = []

//A*(B+C)
//A+B*C
//A+B
//A+B*C-D/E
let operations: [String: Int] = ["+": 1, "-": 1, "*": 2, "/": 2]
var stack: [String] = []
for char in input {
    if char == "(" {
        stack.append(char)
    } else if char == ")" {
        while let top = stack.last, top != "(" {
            result.append(top)
            stack.removeLast()
        }
        stack.popLast()
    } else {
        if let priority = operations[char] { //연산자
            while let top = stack.last, top != "(" {
                guard let topPriority = operations[top], topPriority >= priority else { break }
                result.append(stack.popLast()!)
            }
            stack.append(char)
        } else { //알파벳
            result.append(char)
        }
    }
}

if !stack.isEmpty {
    result.append(contentsOf: stack.reversed())
}
result = result.filter { $0 != "(" && $0 != ")" }

print(result.joined())
