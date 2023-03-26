//
//  12933.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/26.
//

import Foundation

var input = Array(readLine()!)

let target = Array("quack")
var result = 0
while !input.isEmpty && input.count % 5 == 0 {
    var cnt = 0
    var isHaveDuck = false
    for i in 0..<input.count {
        if input[i] == target[cnt % 5] {
            cnt += 1
            if cnt == 5 {
                isHaveDuck = true
            }
            input[i] = "-"
        }
    }
    
    if isHaveDuck {
        input = input.filter { $0 != "-" }
        result += 1
    } else {
        break
    }
}

if input.isEmpty {
    print(result)
} else {
    print("-1")
}
