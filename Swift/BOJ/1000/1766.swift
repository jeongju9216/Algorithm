//
//  1766.swift
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
    let ab = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    dict[ab[0], default: []].append(ab[1])
    inDegree[ab[1]] += 1
}

var queue: [Int] = []
for i in 1...n {
    if inDegree[i] == 0 {
        queue.append(i)
    }
}

var result: [Int] = []
while !queue.isEmpty {
    //난이도로 정렬
    queue.sort(by: <)
    
    let node = queue.removeFirst()
    result.append(node)
    
    for next in dict[node] ?? [] {
        inDegree[next] -= 1
        if inDegree[next] == 0 {
            queue.append(next)
        }
    }
}

print(result.map { String($0) }.joined(separator: " "))
