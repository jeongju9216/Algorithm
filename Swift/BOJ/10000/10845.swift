//
//  10845.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/10.
//

import Foundation

let n = Int(readLine()!)!
var queue: [String] = []

for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { String($0) }
    switch input[0] {
    case "push":
        queue.append(input[1])
    case "pop":
        if !queue.isEmpty {
            let item = queue.removeFirst()
            print(item)
        } else {
            print("-1")
        }
    case "size":
        print(queue.count)
    case "empty":
        print(queue.isEmpty ? "1" : "0")
    case "front":
        print(queue.first ?? -1)
    case "back":
        print(queue.last ?? -1)
    default: break
    }
}
