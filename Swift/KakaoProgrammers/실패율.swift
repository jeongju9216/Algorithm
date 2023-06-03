//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/17.
//

import Foundation

//도달했는데 클리어하지 못한 플레이어 수 / 도달한 플레이어 수

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var playerCount: Int = stages.count
    
    var stageCounts: [Int] = Array(repeating: 0, count: N)
    for stage in stages {
        if stage > N { continue }
        
        stageCounts[stage-1] += 1
    }
    print("stageCounts: \(stageCounts)")
    
    var failures: [(Int, Double)] = []
    for i in 0..<stageCounts.count {
        failures.append((i+1, Double(stageCounts[i]) / Double(playerCount)))
        playerCount -= stageCounts[i]
    }
    print("failures: \(failures)")
    
    let result = failures.sorted { $0.1 > $1.1 }.map { $0.0 }
    return result
}

print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3]))
