//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/26.
//

import Foundation

func solution(_ n:Int) -> Int {
    var isPrime: [Bool] = Array(repeating: true, count: n+1)
    
    isPrime[0] = false
    isPrime[1] = false
    
    if n >= 4 {
        for i in 2...Int(sqrt(Double(n))) {
            for j in 2...n/i {
                isPrime[i * j] = false
            }
        }
    }
    
    let result = isPrime.filter { $0 }.count
    
    //let result = (1...n).filter { isPrime($0) }.count
    return result
}

func isPrime(_ n: Int) -> Bool {
    if n <= 3 {
        return n == 1 ? false : true
    } else {
        for i in (2...Int(sqrt(Double(n)))) {
            if n % i == 0 {
                return false
            }
        }

        return true
    }
}

let n = 5
print(solution(n))
