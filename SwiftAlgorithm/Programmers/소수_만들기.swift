//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/22.
//

import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count {
                let sum = nums[i] + nums[j] + nums[k]
                if isPrime(sum) {
                    answer += 1
                }
            }
        }
    }
    
    return answer
}

func isPrime(_ number: Int) -> Bool {
    
    if number < 4 {
        return (number == 1) ? false : true
    } else {
        for i in 2...Int(sqrt(Double(number))) {
            if number % i == 0 {
                return false
            }
        }
    }
    
    return true
}

let nums = [1,2,7,6,4]
print(solution(nums))
