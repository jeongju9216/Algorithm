//
//  HigherOrderFunction.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/12.
//

import Foundation

public func measureTime(_ closure: () -> ()) -> TimeInterval {
    let startDate = Date()
    closure()
    return Date().timeIntervalSince(startDate)
}

let time = 10000000
var forResult: TimeInterval = 0.0, highResult: TimeInterval = 0.0
var testArray: [Int] = (0..<time).map { $0 }

for i in 0..<10 {
    var sum = 0
    var arr: [Int] = [], arr2: [Int] = []
    let result = measureTime {
        for i in testArray {
            arr.append(i)
            if i % 2 == 0 {
                arr2.append(i)
            }
            sum += i
        }
    }
    
    forResult += result
    print("[\(i)] for 1000만: \(result)(s)")
}

print("")

for i in 0..<10 {
    let result = measureTime {
        var arr = testArray.map { $0 }
        var arr2 = testArray.filter { $0 % 2 == 0 }
        var sum = testArray.reduce(0, +)
    }
    
    highResult += result
    print("[\(i)] All 1000만: \(result)(s)")
}

print("")

let compareResult = (forResult > highResult ? forResult / highResult : highResult / forResult)
print("[Total]")
print(String(format: "for-in: %.2f(s)", forResult))
print(String(format: "All: %.2f(s)", highResult))
print(String(format: "%.2f(s)배 차이", compareResult))
