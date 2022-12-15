//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/31.
//

import Foundation

let alphabets: [String] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }
let count = Int(readLine()!)!
var string = readLine()!.map { String($0) }
var dict: [String: Int] = [:]
for i in 0..<count {
    let number = Int(readLine()!)!
    dict[alphabets[i]] = number
}

for (i, char) in string.enumerated() {
    guard let number = dict[char] else { continue }
    string[i] = String(number)
}

var stack: [String] = []
for char in string {
    if let _ = Double(char) { //숫자인 경우
        stack.append(char)
    } else { //연산자인 경우
        if stack.count >= 2 { //피연산자가 두 개 이상인 경우 계산
            
            let num2 = Double(stack.popLast()!)!
            let num1 = Double(stack.popLast()!)!
            
            var result = 0.0
            switch char {
            case "+": result = num1 + num2
            case "-": result = num1 - num2
            case "*": result = num1 * num2
            case "/": result = num1 / num2
            default: break
            }
            
            stack.append(String(result))
        } else {
            stack.append(char)
        }
    }
}

print(String.init(format: "%.2f", Double(stack.first!)!))
