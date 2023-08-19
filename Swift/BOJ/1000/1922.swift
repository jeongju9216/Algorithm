//
//  1922.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/19.
//

import Foundation

typealias Node = (s: Int, e: Int, c: Int)

func find(node: Int) -> Int {
    if parents[node] == node {
        return node
    } else {
        parents[node] = find(node: parents[node])
        return parents[node]
    }
}

func union(_ node1: Int, _ node2: Int) -> Bool {
    let root1 = find(node: node1)
    let root2 = find(node: node2)
    if root1 == root2 {
        return false
    } else {
        parents[root2] = root1
        return true
    }
}

func kruskal() -> Int {
    var sum = 0
    var edgeCount = 0
    for node in pq {
        if union(node.s, node.e) {
            sum += node.c
            edgeCount += 1
            if edgeCount == n - 1 {
                return sum
            }
        }
    }
    return 0
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var pq: [Node] = []
for _ in 0..<m {
    let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    pq.append((arr[0], arr[1], arr[2]))
}

pq.sort { $0.c < $1.c }

var parents: [Int] = []
for i in 0...n {
    parents.append(i)
}

print(kruskal())
