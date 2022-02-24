//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/24.
//

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var scores: [(Int, Double)] = []
            
    var stageCount = stages.count

    var counts = Array(repeating: 0, count: N+1)
    for stage in stages {
        counts[stage-1] += 1
    }
    
    (1...N).forEach { i in
        let count = counts[i-1]
        let score = Double(count) / Double(stageCount)
        
        scores.append((i, score))
        stageCount -= count
    }
    
    return scores.sorted { $0.1 > $1.1 }.map { $0.0 }
}

let N = 5
let stages = [2, 1, 2, 6, 2, 4, 3, 3]

print(solution(N, stages))
