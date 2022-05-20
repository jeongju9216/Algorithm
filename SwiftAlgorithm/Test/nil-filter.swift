//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/13.
//

import Foundation

func measureTime(_ closure: () -> ()) -> TimeInterval {
    let startDate = Date()
    closure()
    return Date().timeIntervalSince(startDate)
}

let time = 10000000
var testArray: [Int?] = (0..<time).map { _ in nil }
for (i, _) in testArray.enumerated() {
    if i % 2 == 0 {
        testArray[i] = 10
    }
}
var guardTime: TimeInterval = 0, compactMapTime: TimeInterval = 0, filterTime: TimeInterval = 0

for i in 0..<10 {
    var arr: [Int] = []
    let result = measureTime {
        for i in testArray {
            guard let i = i else { continue }
            arr.append(i)
        }
    }
    
    guardTime += result
    print("[\(i)] guard 1000만: \(result)(s) / arr size: \(arr.count)")
}

for i in 0..<10 {
    var arr: [Int] = []
    let result = measureTime {
        arr = testArray.compactMap { $0 }
    }
    
    compactMapTime += result
    print("[\(i)] compactMap 1000만: \(result)(s) / arr size: \(arr.count)")
}

for i in 0..<10 {
    var arr: [Int?] = []
    let result = measureTime {
        arr = testArray.filter { $0 != nil }
    }
    
    filterTime += result
    print("[\(i)] filter 1000만: \(result)(s) / arr size: \(arr.count)")
}
