//
//  3040.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/09.
//

import Foundation

func recursive(_ current: [Int], _ depth: Int) {
    if !result.isEmpty {
        return
    }
    
    if current.count == 7 {
        if current.reduce(0, +) == 100 {
            result = current
        }
        return
    }
    
    for i in depth+1..<9 {
        recursive(current + [arr[i]], i)
    }
}

var result: [Int] = []
var arr: [Int] = []
for _ in 0..<9 {
    arr.append(Int(readLine()!)!)
}

recursive([], -1)
result.forEach { print($0) }
