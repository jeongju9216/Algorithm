//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/22.
//

import Foundation

func measureTime(_ closure: () -> ()) -> TimeInterval {
    let startDate = Date()
    closure()
    return Date().timeIntervalSince(startDate)
}

let time = 10000000
let testArr: [Substring] = String(repeating: "1 ", count: time).split { $0 == " " }

var stringTime: TimeInterval = 0, subStringTime: TimeInterval = 0

for i in 1...10 {
    let result = measureTime {
        let _ = testArr.map { Int(String($0))! }
    }

    print("[\(i)] stringTime: \(result)")
    stringTime += result
}

print("")

for i in 1...10 {
    let result = measureTime {
        let _ = testArr.map { Int($0)! }
    }

    print("[\(i)] subStringTime: \(result)")
    subStringTime += result
}

print("\n----- Total -----")
print("stringTime: \(stringTime)")
print("subStringTime: \(subStringTime)")



