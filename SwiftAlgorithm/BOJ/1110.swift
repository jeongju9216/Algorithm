//
//  1110.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/11.
//

import Foundation

let input = Int(readLine()!)!
var newNumber = input
var count = 0

repeat {
    count += 1
    
    let front = newNumber / 10
    let back = newNumber % 10
    let sum = front + back
    
    if sum < 10 {
        newNumber = back * 10 + sum
    } else {
        newNumber = back * 10 + sum % 10
    }
    
} while input != newNumber

print(count)
