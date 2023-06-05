//
//  1744.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/05.
//

import Foundation

let n = Int(readLine()!)!
var plus: [Int] = [], minus: [Int] = []
for _ in 0..<n {
    let input = Int(readLine()!)!
    if input > 0 {
        plus.append(input)
    } else {
        minus.append(input)
    }
}

plus.sort(by: >)
minus.sort(by: <)

var result: [Int] = []
var i = 0
while i < plus.count {
    if i == plus.count - 1 {
        result.append(plus[i])
        break
    }
    
    if plus[i] * plus[i+1] > plus[i] + plus[i+1] {
        result.append(plus[i] * plus[i+1])
        i += 2
    } else {
        result.append(plus[i])
        i += 1
    }
}

i = 0
while i < minus.count {
    if i == minus.count - 1 {
        result.append(minus[i])
        break
    }
   
    if minus[i] * minus[i+1] > minus[i] + minus[i+1] {
        result.append(minus[i] * minus[i+1])
        i += 2
    } else {
        result.append(minus[i])
        i += 1
    }
}

print(result.reduce(0, +))
