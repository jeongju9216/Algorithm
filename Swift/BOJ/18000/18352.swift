//
//  18352.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/20.
//

import Foundation

let nmkx = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (n, m, k, x) = (nmkx[0], nmkx[1], nmkx[2], nmkx[3])
var graph: [Int: [Int]] = [:]
for _ in 0..<m {
    let ab = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    graph[ab[0], default: []].append(ab[1])
}

var dists: [Int] = Array(repeating: Int.max, count: n + 1)

var queue: [(n: Int, time: Int)] = [(x, 0)]
var index = 0
dists[x] = 0

while index < queue.count {
    let node = queue[index]
    index += 1
    
    let nt = node.time + 1
    for next in graph[node.n] ?? [] where dists[next] > nt {
        dists[next] = nt
        queue.append((next, nt))
    }
}

let result: [Int] = (1...n).filter { dists[$0] == k }
print(result.isEmpty ? -1 : result.map { String($0) }.joined(separator: "\n"))
