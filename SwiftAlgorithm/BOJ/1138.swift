//
//  1138.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/08.
//

import Foundation

let n = Int(readLine()!)!
let input: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

var result: [Int] = Array(repeating: 0, count: n)
for i in 0..<input.count {
    let item = input[i]
    
    var blankCount = 0
    for j in 0..<result.count {
        if blankCount == item {
            if result[j] == 0 {
                result[j] = i + 1
                break
            }
        } else if result[j] == 0 {
            blankCount += 1
        }
    }
}

for num in result {
    print(num, terminator: " ")
}
