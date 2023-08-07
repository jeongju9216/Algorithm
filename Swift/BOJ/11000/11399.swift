//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/14.
//

//11399 ATM
import Foundation

let n = Int(readLine()!)!
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()

var result = 0, sum = 0
for i in 0..<input.count {
    sum += input[i]
    
    result += sum
}

print(result)
