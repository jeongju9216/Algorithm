//
//  큰_수_만들기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/14.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let numbers = number.map { Int(String($0))! }
    var stack: [Int] = []
    var count = 0

    for i in 0..<numbers.count {
        while !stack.isEmpty && stack.last! < numbers[i] && count < k {
            stack.popLast()
            count += 1
        }
        
        if count >= k {
            stack.append(contentsOf: numbers[i..<numbers.count])
            break
        } else {
            stack.append(numbers[i])
        }
    }
        
    return stack[0..<numbers.count - k].map { String($0) }.joined()
}
