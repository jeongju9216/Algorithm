//
//  1197.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/21.
//

import Foundation

typealias Node = (s: Int, e: Int, cost: Int)

//트리를 합칠 수 있는지 확인
func union(_ n1: Int, _ n2: Int) -> Bool {
    let root1 = find(n1)
    let root2 = find(n2)
    if root1 == root2 {
        //이미 하나의 트리
        return false
    } else {
        //트리를 합침. 트리를 합칠 때 기준을 줘서 트리를 압축함
        if n1 < n2 {
            parents[root2] = root1
        } else {
            parents[root1] = root2
        }
        
        return true
    }
}

//root를 찾음
func find(_ node: Int) -> Int {
    //자기 자신이 parents면 루트임
    if parents[node] == node {
        return node
    } else {
        parents[node] = find(parents[node])
        return parents[node]
    }
}

func kruscal() -> Int {
    var sum = 0
    var edgeCount = 0
    for node in graph {
        //경로를 사용할 수 있으면
        if union(node.s, node.e) {
            sum += node.cost
            edgeCount += 1
            if edgeCount == v - 1 {
                return sum
            }
        }
    }
    return 0
}

let ve = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (v, e) = (ve[0], ve[1])
var graph: [Node] = []
var parents: [Int] = Array(0...v)

for _ in 0..<e {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    graph.append((input[0], input[1], input[2]))
}

graph.sort { $0.cost < $1.cost }

print(kruscal())
