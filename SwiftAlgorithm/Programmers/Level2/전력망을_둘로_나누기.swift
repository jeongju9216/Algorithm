//
//  전력망을_둘로_나누기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/07.
//

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var graph: [Int: [Int]] = [:]
    for i in 1...n {
        graph.updateValue([], forKey: i)
    }

    for wire in wires {
        graph[wire[0]]?.append(wire[1])
        graph[wire[1]]?.append(wire[0])
    }

    func bfs(_ start: Int) -> Int {
        var queue: [Int] = [start]
        var index = 0

        while index < queue.count {
            let last = queue[index]
            index += 1

            visited[last] = true
            for node in graph[last]! {
                if !visited[node] {
                    queue.append(node)
                }
            }
        }

        return index
    }
    
    var visited = Array(repeating: false, count: n+1)
    visited[1] = true
    let count = bfs(2)
    var result = abs(count - (n - count))
    
    for i in 1...n {
        visited = Array(repeating: false, count: n+1)
        visited[i] = true
        let count = bfs(1)
        result = min(result, abs(count - (n - count)))
    }
    
    // print("counts: \(counts)")
    return result
}

//edge를 하나씩 삭제하면서 bfs나 dfs를 돌린다.
//하나씩 삭제 한다 -> 시작할 때 방문한 노드를 하나씩 추가한다.
//노드의 개수를 센다.

//원래는 트리 형태이기 때문에 동떨어진 노드는 없다.
//즉, 전선 하나를 끊으면 무조건 두 구역으로 나뉜다.
