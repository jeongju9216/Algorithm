//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/29.
//

import Foundation

func countDistance(_ graph: [Int: [Int]], n: Int) -> [Int] {
    var needVisited: [(Int, Int)] = [(1, 0)]
    var counts: [Int] = Array(repeating: -1, count: n+1)
    counts[1] = 0
    
    var index = 0
    while index < needVisited.count {
        let (node, count) = needVisited[index]
        index += 1
        
        for nextNode in graph[node]! {
            guard counts[nextNode] == -1 else {
                continue
            }
            
            counts[nextNode] = count+1
            needVisited.append((nextNode, count+1))
        }
    }
    
    return counts
}

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph: [Int: [Int]] = [:]
    for eg in edge {
        if graph[eg[0]] == nil { graph[eg[0]] = [] }
        if graph[eg[1]] == nil { graph[eg[1]] = [] }
        
        graph[eg[0]]?.append(eg[1])
        graph[eg[1]]?.append(eg[0])
    }
    // print("graph: \(graph)")
    
    let distances = countDistance(graph, n: n)
    // print("distances: \(distances)")
    
    let maxValue = distances.max()!
    var result = distances.filter { $0 == maxValue }.count
    
    return result
}
