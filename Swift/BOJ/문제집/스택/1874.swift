//
//  1874.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/28.
//

import Foundation

let n = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<n {
    let num = Int(readLine()!)!
    arr.append(num)
}

var result: [String] = []
var stack: [Int] = []
var index = 0
for i in 1...n {
    stack.append(i)
    result.append("+")
    
    while let top = stack.last, top == arr[index] {
        index += 1
        stack.removeLast()
        result.append("-")
    }
}

if stack.isEmpty {
    result.forEach { print($0) }
} else {
    print("NO")
}
