//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/15.
//

import Foundation

func isOperation(_ string: String) -> Bool {
    return (string == "+" || string == "-" || string == "*")
}

func solution(_ expression: String) -> Int64 {
    let orders: [[String]] = [["+", "-", "*"], ["+", "*", "-"],
                              ["-", "+", "*"], ["-", "*", "+"],
                              ["*", "+", "-"], ["*", "-", "+"]]
    
    
    var arr: [String] = []
    var tmp: String = ""
    for char in expression {
        if char == "+" || char == "-" || char == "*" {
            arr.append(tmp)
            tmp = ""
            
            arr.append(String(char))
        } else {
            tmp += String(char)
        }
    }
    arr.append(tmp)
    
    var result: Int64 = 0
    for order in orders {
        var tmpArr = arr
        for op in order {
            var stack: [String] = []
        
            for str in tmpArr {
                //계산
                if let last = stack.last, isOperation(last), last == op {
                    let op = stack.removeLast()
                    let num1 = Int64(stack.removeLast())!
                    let num2 = Int64(str)!
                    
                    switch op {
                    case "+":
                        stack.append("\(num1 + num2)")
                    case "-":
                        stack.append("\(num1 - num2)")
                    case "*":
                        stack.append("\(num1 * num2)")
                    default: break
                    }
                } else {
                    stack.append(str)
                }
            }
            
            tmpArr = stack
        }
        
        result = max(result, Int64(abs(Int(tmpArr.first!)!)))
    }
    
    return result
}
