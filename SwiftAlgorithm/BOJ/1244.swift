//
//  1244.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/25.
//

import Foundation

let switchCount = Int(readLine()!)!
var switches = readLine()!.components(separatedBy: " ").map { $0 == "1" }

var humanCount = Int(readLine()!)!
var humans: [[Int]] = []
for _ in 0..<humanCount {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    humans.append(input)
}

for human in humans {
    let isMan = human[0] == 1
    let number = human[1]
    
    if isMan {
        for i in number...switchCount {
            if i % number == 0 {
                switches[i-1].toggle()
            }
        }
    } else {
        switches[number-1].toggle()
        var tmp = 1
        while number - tmp - 1 >= 0 && number + tmp - 1 < switchCount {
            if switches[number - tmp - 1] == switches[number + tmp - 1] {
                switches[number - tmp - 1].toggle()
                switches[number + tmp - 1].toggle()
                tmp += 1
            } else {
                break
            }
        }
    }
}

let result = switches.map { $0 ? 1 : 0 }
for i in 1...switchCount {
    print(result[i-1], terminator: " ")
    if i % 20 == 0 {
        print("")
    }
}
