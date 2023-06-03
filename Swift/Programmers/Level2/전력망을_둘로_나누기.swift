//
//  전력망을_둘로_나누기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/07.
//

import Foundation

//양방향 그래프로 만들기
//하나씩 끊으면서 dfs로 카운팅하기
//n - 개수 = 나머지 개수

func dfs(_ num: Int) {
    if !visited[num] {
        visited[num] = true
        count += 1
        
        for node in graph[num] ?? [] {
            if !visited[node] {
                dfs(node)
            }
        }
    }
}

var graph: [Int: [Int]] = [:]
var visited: [Bool] = []
var count = 0

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    
    var result = Int.max
    for i in 0..<wires.count {
        count = 0
        visited = Array(repeating: false, count: n + 1)
        graph = [:]
        
        for j in 0..<wires.count where i != j {
            graph[wires[j][0], default: []].append(wires[j][1])
            graph[wires[j][1], default: []].append(wires[j][0])
        }
        
        dfs(1)
        
        let diff = abs(count - (n - count))
        result = min(result, diff)
    }
    
    return result
}
