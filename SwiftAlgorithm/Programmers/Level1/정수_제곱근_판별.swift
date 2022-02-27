//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/27.
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    let sqrtNum = Int64(ceil(sqrt(Double(n))))
    
    return Int64(sqrtNum * sqrtNum == n ? (sqrtNum+1) * (sqrtNum+1) : -1)
}

let n:Int64 = 3
print(solution(n))
