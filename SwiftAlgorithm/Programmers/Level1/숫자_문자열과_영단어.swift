//
//  main.swift
//  Algorithm
//
//  Created by 유정주 on 2021/09/12.
//
//숫자 문자열과 영단어
import Foundation

func solution(_ s:String) -> Int {
    var result: String = ""
    var temp: String = ""
    
    for c in s {
        if c.isNumber {
            result += String(c)
        } else {
            temp += String(c)
        }
        
        for i in 0 ..< list.count {
            if temp == list[i] {
                temp = ""
                result += String(i)
            }
        }
    }
    
    return Int(result) ?? 0
}

let list = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

var input = readLine()!
print(solution(input))

