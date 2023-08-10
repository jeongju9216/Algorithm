//
//  2252.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/10.
//

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var dict: [Int: [Int]] = [:]
var inDegree = Array(repeating: 0, count: n + 1)

for _ in 0..<m {
    let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    dict[arr[1], default: []].append(arr[0])
    inDegree[arr[0]] += 1
}

var queue: [Int] = []
for i in 1...n {
    if inDegree[i] == 0 {
        queue.append(i)
    }
}

var index = 0
var result: [Int] = []
while index < queue.count {
    let node = queue[index]
    index += 1
    
    result.append(node)
    
    for next in dict[node] ?? [] {
        inDegree[next] -= 1
        if inDegree[next] == 0 {
            queue.append(next)
        }
    }
}

result = result.reversed()
print(result.map { String($0) }.joined(separator: " "))
