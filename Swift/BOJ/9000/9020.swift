//
//  9020.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/15.
//

import Foundation

func getPrime(_ n: Int) -> Set<Int> {
    var primes = Set(2...n)
    
    for i in 2...n {
        guard primes.contains(i) else { continue }
        
        for j in stride(from: i * 2, through: n, by: i) {
            primes.remove(j)
        }
    }
    
    return primes
}

let primeSet = getPrime(10000)
let primes = primeSet.sorted(by: >)

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    for i in primes where i <= n/2 {
        let j = n - i
        if primeSet.contains(i) && primeSet.contains(j) {
            print("\(i) \(j)")
            break
        }
    }
}
