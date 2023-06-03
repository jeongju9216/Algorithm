//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/17.
//

import Foundation

func dropDot(_ string: inout String) {
    if !string.isEmpty && string.first! == "." {
        string.removeFirst()
    }
    
    if !string.isEmpty && string.last! == "." {
        string.removeLast()
    }
}

func solution(_ new_id:String) -> String {
    var result: String = new_id
    
    //1
    result = result.lowercased()
    
    //2
    result = result.replacingOccurrences(of: "[^a-z0-9-_.]", with: "", options: .regularExpression)
    
    //3
    while result.contains("..") {
        result = result.replacingOccurrences(of: "..", with: ".")
    }
    
    //4
    dropDot(&result)
    
    //5
    if result.isEmpty {
        result = "a"
    }
    
    //6
    let len = result.count
    if len >= 16 {
        result.removeLast(len - 15)
    }
    
    dropDot(&result)
    
    //7
    if result.count <= 2 {
        let lastChar = String(result.last!)
        result += Array(repeating: lastChar, count: 3 - result.count).joined()
    }
        
    return result
}

print(solution("...!@BaT#*..y.abcdefghijklm"))
