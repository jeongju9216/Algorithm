//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/25.
//

//11724 연결 요소의 개수
import Foundation

let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
let edges = inputs[0]
let lines = inputs[1]

var graph: [Int: [Int]] = [:]
var visitNode: [Int] = []
var needVisitNode: [Int] = []

for edge in 1...edges {
    graph.updateValue([], forKey: edge)
}

for _ in 0..<lines {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[input[0]]?.append(input[1])
    graph[input[1]]?.append(input[0])
}

var result: Int = 0
for i in 1...edges {
    if visitNode.contains(i) {
        continue
    }
    
    result += 1
    
    needVisitNode.append(i)
    while !needVisitNode.isEmpty {
        let node = needVisitNode.popLast()!
        if !visitNode.contains(node) {
            visitNode.append(node)
            needVisitNode.append(contentsOf: graph[node] ?? [])
        }
    }
}

print(result)
