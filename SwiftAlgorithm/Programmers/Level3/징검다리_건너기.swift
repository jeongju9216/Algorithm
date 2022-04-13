//
//  징검다리_건너기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/13.
//

import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var left = 1
    var right = 200000000
    
    while left < right {
        let mid = (left + right) / 2
        var count = 0
        for i in 0..<stones.count {
            if stones[i] - mid <= 0 {
                count += 1
                
                if count >= k {
                    break
                }
            } else {
                count = 0
            }
        }
        
        if count >= k {
            right = mid
        } else {
            left = mid + 1
        }
    }
    
    return left
}
