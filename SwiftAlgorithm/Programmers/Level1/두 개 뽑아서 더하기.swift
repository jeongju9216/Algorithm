//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/25.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: [Int] = []
    
    (0..<numbers.count).forEach { i in
        (i+1..<numbers.count).forEach { j in
            result.append(numbers[i] + numbers[j])
        }
    }
    
    return Array(Set(result)).sorted()
}

let numbers = [2,1,3,4,1]
print(solution(numbers))
