//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/06.
//

import Foundation

func solution(_ land:[[Int]]) -> Int{
    var answer = 0
    var sums: [Int] = land[0]
    
    for index in 1..<land.count {
        var tmpSums: [Int] = sums
        for i in 0..<4 {
            for j in 0..<4 {
                if i != j {
                    tmpSums[i] = max(tmpSums[i], land[index][i] + sums[j])
                }
            }
        }
        
        sums = tmpSums
    }

    answer = sums.max()!
    return answer
}
