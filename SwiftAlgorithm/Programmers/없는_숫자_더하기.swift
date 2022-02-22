//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/22.
//

import Foundation

func solution(_ numbers:[Int]) -> Int {
    var result = 0
    
    for i in 0...9 {
        if !(numbers.contains(i)) {
            result += i
        }
    }
    
    return result
    
    //return (0...9).filter { !numbers.contains($0) }.reduce(0, +)
}

let numbers = [5,8,4,0,6,7,9]
print(solution(numbers))
