//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/11.
//

import Foundation

func solution(_ numbers:[Int]) -> String {
    var numbers = numbers.map { String($0) }.sorted {
        return Int($0 + $1)! > Int($1 + $0)!
    }
    
    if numbers[0] == "0" {
        return "0"
    }
    
    return numbers.joined()
}
