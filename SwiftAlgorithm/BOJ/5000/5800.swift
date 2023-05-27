//
//  5800.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/10.
//

import Foundation

let k = Int(readLine()!)!
for i in 1...k {
    var input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    input.removeFirst()
    
    input.sort()
    
    var maxDiff = 0
    for j in 1..<input.count {
        maxDiff = max(maxDiff, input[j] - input[j-1])
    }
    print("Class \(i)")
    let max = input.max()!
    let min = input.min()!
    print("Max \(max), Min \(min), Largest gap \(maxDiff)")
}
