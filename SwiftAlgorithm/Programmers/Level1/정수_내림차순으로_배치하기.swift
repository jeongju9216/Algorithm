//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/27.
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    let result = String(String(n).sorted(by: >))
    
    return Int64(result)!
}

let n = 118372
print(solution(Int64(n)))
