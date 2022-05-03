//
//  피로도.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/03.
//

import Foundation

func combi(_ n: Int) -> [[Int]] {
    var result: [[Int]] = []
    
    func combination(_ arr: [Int]) {
        if arr.count == n {
            result.append(arr)
            return
        } else {
            for i in 0..<n {
                if !arr.contains(i) {
                    combination(arr + [i])
                }
            }
        }
    }
    
    combination([])
    
    return result
}

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    
    let combination = combi(dungeons.count)
    // print("combination: \(combination)")
    
    var result = 0
    combination.forEach {
        var k = k
        
        let count = $0.map {
            if k >= dungeons[$0][0] {
                k -= dungeons[$0][1]
                return 1
            } else {
                return -1
            }
        }.filter { $0 > 0 }.count
        
        result = max(result, count)
    }
    
    return result
}
