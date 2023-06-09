//
//  1644.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/09.
//

import Foundation

let n = Int(readLine()!)!

if n == 1 {
    print("0")
    exit(0)
}

var isPrime = [false, false] + Array(repeating: true, count: n - 1)
var primes: [Int] = []
for i in 2...n {
    if !isPrime[i] { continue }
    
    primes.append(i)
    
    var j = 2
    while i * j <= n {
        isPrime[i * j] = false
        j += 1
    }
}

var left = 0, right = 0
var sum = primes[0]
var result = 0
while left <= right {
    if sum >= n {
        if sum == n {
            result += 1
        }
        
        sum -= primes[left]
        left += 1
    } else {
        if right + 1 < primes.count {
            right += 1
            sum += primes[right]
        } else {
            break
        }
    }
}

print(result)
