//
//  1971.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/01.
//

import Foundation

class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        guard source != destination else { return true }
        
        //count가 0이면 false
        var graph: [Int: [Int]] = [:]
        for edge in edges {
            graph[edge[0], default: []].append(edge[1])
            graph[edge[1], default: []].append(edge[0])
        }
        
        var queue: [Int] = [source]
        var index: Int = 0
        var visited: [Bool] = Array(repeating: false, count: n)
        visited[source] = true
        
        while index < queue.count {
            let node = queue[index]
            index += 1
            
            guard let nexts = graph[node] else { continue }
            
            for next in nexts {
                if next == destination {
                    return true
                }
                
                if !visited[next] {
                    visited[next] = true
                    queue.append(next)
                }
            }
        }
        
        return false
    }
}
