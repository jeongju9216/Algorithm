//
//  25206.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/08.
//

import Foundation

var sum = 0.0, totalCount = 20.0, totalSum = 0.0
for _ in 0..<20 {
    let input = readLine()!.components(separatedBy: " ")
    guard input[2] != "P" else {
        continue
    }
    
    var multi = 0.0
    switch input[2] {
    case "A+": multi = 4.5
    case "A0": multi = 4.0
    case "B+": multi = 3.5
    case "B0": multi = 3.0
    case "C+": multi = 2.5
    case "C0": multi = 2.0
    case "D+": multi = 1.5
    case "D0": multi = 1.0
    case "F": multi = 0.0
    default: break
    }
    
    let num = Double(input[1])!
    sum += num
    totalSum += (num * multi)
}
print(totalSum / sum)
