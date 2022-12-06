//
//  숫자 짝꿍.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/06.
//

import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var xNums: [Int] = Array(repeating: 0, count: 10) //0~9
    var yNums: [Int] = Array(repeating: 0, count: 10)
    
    for char in X {
        xNums[Int(String(char))!] += 1
    }
    
    for char in Y {
        yNums[Int(String(char))!] += 1
    }
    
    var result: String = ""
    for i in stride(from: 9, to: 0 - 1, by: -1) {
        while xNums[i] > 0 && yNums[i] > 0 {
            xNums[i] -= 1
            yNums[i] -= 1
            
            result += "\(i)"
        }
    }
    
    if result.isEmpty {
        return "-1"
    }
    
    if let num = Int(result), num == 0 {
        return "0"
    } else {
        return result
    }
}
