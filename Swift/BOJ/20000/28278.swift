//
//  28278.swift
//  Algorithm
//
//  Created by 유정주 on 2023/09/28.
//

import Foundation

let n = Int(readLine()!)!

var stack: [Int] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    switch input[0] {
    case 1:
        stack.append(input[1])
    case 2:
        print(stack.popLast() ?? -1)
    case 3:
        print(stack.count)
    case 4:
        print(stack.isEmpty ? 1 : 0)
    case 5:
        print(stack.last ?? -1)
    default: break
    }
}
