//
//  3613.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/04.
//

import Foundation

let input = Array(readLine()!).map { String($0) }

var isCpp = input.contains("_")
var isJava = input.filter { "A"..."Z" ~= $0 }.count > 0

if isCpp && isJava ||
    input.first! == "_" || input.last! == "_" ||
    "A"..."Z" ~= input.first! {
    print("Error!")
    exit(0)
} else if isCpp {
    var word = ""
    var result = input[0]
    for i in 1..<input.count {
        if input[i] == "_" {
            if input[i-1] == "_" {
                print("Error!")
                exit(0)
            }
            
            result += word
            word = ""
        } else if input[i-1] == "_" {
            word += input[i].uppercased()
        } else {
            word += input[i]
        }
    }
    if !word.isEmpty {
        result += word
    }
    
    print(result)
} else if isJava {
    var result = input[0]
    for i in 1..<input.count {
        if "A"..."Z" ~= input[i] {
            result += "_\(input[i].lowercased())"
        } else {
            result += input[i]
        }
    }
    
    print(result)
} else {
    print(input.joined())
}
