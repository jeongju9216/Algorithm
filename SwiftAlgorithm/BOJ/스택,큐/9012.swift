//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/03.
//

//9012 괄호
import Foundation

let count = Int(readLine()!)!
var stack: [Character] = []

for _ in 0..<count {
    stack = []
    
    let input = String(readLine()!)
    for s in input {
        if s == "(" {
            stack.append(s)
        } else if s == ")" {
            guard let pop = stack.last, pop == "(" else {
                stack.append(s)
                break
            }
            
            stack.removeLast()
        }
    }

    print(stack.isEmpty ? "YES" : "NO")
}

