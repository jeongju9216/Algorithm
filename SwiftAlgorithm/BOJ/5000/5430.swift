//
//  5430.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/04.
//

import Foundation

let testCase = Int(readLine()!)!
for _ in 0..<testCase {
    let commands = Array(readLine()!)
    let n = Int(readLine()!)!
    let nums = readLine()!.dropFirst().dropLast().components(separatedBy: ",").filter { !$0.isEmpty }
    
    var head = 0, tail = n - 1
    var isReversed = false
    var isError = false
    for command in commands {
        if command == "R" {
            isReversed.toggle()
        } else if command == "D" {
            if nums.isEmpty || head > tail {
                isError = true
                break
            }
            
            if !isReversed {
                head += 1
            } else {
                tail -= 1
            }
        }
    }

    if isError {
        print("error")
    } else if head > tail {
        print("[]")
    } else {
        if isReversed {
            let result = "[" + nums[head...tail].reversed().joined(separator: ",") + "]"
            print(result)
        } else {
            let result = "[" + nums[head...tail].joined(separator: ",") + "]"
            print(result)
        }
    }
}
