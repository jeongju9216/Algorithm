//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/01.
//

import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var result = 0
    
    var graph: [[Int]] = Array(repeating: Array(repeating: Int.max, count: n+1), count: n+1)
    
    //그래프 생성
    for fare in fares {
        graph[fare[0]][fare[1]] = fare[2]
        graph[fare[1]][fare[0]] = fare[2]
    }
    
    //to -> middle / middle -> from 구하기
    for middle in 1...n {
        for to in 1...n {
            guard graph[to][middle] < Int.max, to != middle else { continue }
            
            for from in 1...n {
                guard graph[middle][from] < Int.max, middle != from, to != from else { continue }
                
                //to -> from or to -> middle -> from
                graph[to][from] = min(graph[to][from], graph[to][middle] + graph[middle][from])
            }
        }
    }

    //직접 가는 것 vs 합승하는 것
    result = graph[s][a] + graph[s][b]
    for i in 1...n {
        let start = graph[s][i]
        let aCost = a == i ? 0 : graph[i][a]
        let bCost = b == i ? 0 : graph[i][b]
        
        guard start < Int.max, aCost < Int.max, bCost < Int.max else { continue }
        
        result = min(result, start + aCost + bCost)
    }
    
    return result
}
