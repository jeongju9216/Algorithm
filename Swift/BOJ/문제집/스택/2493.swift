//
//  2493.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/28.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int($0)! }

var stack: [(num: Int, index: Int)] = []
var result: [Int] = []
for i in 0..<arr.count {
    while let top = stack.last, top.num < arr[i] {
        //자기보다 낮은거 다 없앰
        stack.removeLast()
    }
    
    if stack.isEmpty {
        result.append(0)
    } else {
        result.append(stack.last!.index)
    }
    
    stack.append((arr[i], i + 1))
}

result.forEach { print($0, terminator: " ") }
