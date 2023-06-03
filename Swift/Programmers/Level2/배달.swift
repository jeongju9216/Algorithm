//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/17.
//

import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 0
    
    var costs: [Int] = Array(repeating: Int.max, count: N+1)
    var graph: [[Int]] = Array(repeating: Array(repeating: Int.max, count: N+1), count: N+1)
    for r in road {
        graph[r[0]][r[1]] = min(r[2], graph[r[0]][r[1]])
        graph[r[1]][r[0]] = min(r[2], graph[r[1]][r[0]])
    }

    var queue: [(idx: Int, cost: Int)] = [(1, 0)]
    var index = 0
    costs[1] = 0 //자기 자신

    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for next in 1...N {
            if graph[node.idx][next] == Int.max {
                continue
            }
            
            let nCost = node.cost + graph[node.idx][next]
            if graph[node.idx][next] != Int.max && nCost < costs[next] {
                costs[next] = nCost
                queue.append((next, nCost))
            }
        }
    }
     
    answer = costs.filter { $0 <= k }.count
    return answer
}
