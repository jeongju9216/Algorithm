//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/15.
//

import Foundation

func splitExpression(_ expression: String) -> [String] {
    var result: [String] = []
    var str = ""
    for ch in expression {
        let s = String(ch)
        switch s {
            case "-", "+", "*":
                result.append(str)
                result.append(s)
                str = ""
            default:
                str += s
                break
        }
    }
    
    result.append(str)
    return result
}

func solution(_ expression:String) -> Int64 {
    let expressionsArr: [[String]] = [["+", "-", "*"], ["+", "*", "-"],
                                      ["-", "+", "*"], ["-", "*", "+"],
                                      ["*", "+", "-"], ["*", "-", "+"]]
    
    let arr = splitExpression(expression)
    var maxResult: Int64 = Int64.min
    for expressions in expressionsArr { //6회 반복
        var calArr: [String] = []
        var tempArr = arr
        for exp in expressions { //3회 반복
            calArr = []
            if tempArr.contains(exp) {
                for item in tempArr {
                    if calArr.count > 0 && calArr.last! == exp {
                        let _ = calArr.popLast()!
                        let num = calArr.popLast()!
                        
                        switch exp {
                            case "+": calArr.append(String(Int64(num)! + Int64(item)!))
                            case "-": calArr.append(String(Int64(num)! - Int64(item)!))
                            case "*": calArr.append(String(Int64(num)! * Int64(item)!))
                            default: break
                        }
                    } else {
                        calArr.append(item)
                    }
                }
            }
            tempArr = calArr
            
            if tempArr.count == 1 {
                break
            }
        }
                
        if !tempArr.isEmpty {
            let num = Int64(abs(Int64(tempArr[0])!))
            maxResult = max(maxResult, num)
        }
    }
    
    return maxResult
}
