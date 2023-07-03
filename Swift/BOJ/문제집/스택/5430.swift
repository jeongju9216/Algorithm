//
//  5430.swift
//  Algorithm
//
//  Created by 유정주 on 2023/07/03.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let commands = Array(readLine()!)
    let n = Int(readLine()!)!
    let arr = readLine()!.dropFirst().dropLast().split { $0 == "," }.map { Int($0)! }
    
    var head = 0, tail = arr.count - 1
    var isReversed = false
    var isError = false
    for command in commands {
        if command == "R" {
            isReversed.toggle()
        } else if command == "D" {
            if head > tail {
                isError = true
                break
            }
            
            if isReversed {
                tail -= 1
            } else {
                head += 1
            }
        }
    }
    
    if isError {
        print("error")
    } else if head > tail {
        print("[]")
    } else {
        if isReversed {
            print("[\(arr[head...tail].reversed().map { String($0) }.joined(separator: ","))]")
        } else {
            print("[\(arr[head...tail].map { String($0) }.joined(separator: ","))]")
        }
        
    }
}
