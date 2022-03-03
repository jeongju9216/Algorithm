//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/02.
//

import Foundation

let loopCount = Int(readLine()!)!
var stack: [Int] = []

for _ in 0..<loopCount {
    let command = readLine()!.split(separator: " ").map { String($0) }
    switch command.first! {
    case "push":
        stack.append(Int(command.last!)!)
    case "pop":
        let pop = stack.popLast() ?? -1
        print(pop)
    case "size":
        print(stack.count)
    case "empty":
        print(stack.isEmpty ? "1" : "0")
    case "top":
        let top = stack.last ?? -1
        print(top)
    default: break
    }
}
