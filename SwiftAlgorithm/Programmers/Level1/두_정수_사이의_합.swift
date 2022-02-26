//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/26.
//

func solution(_ a:Int, _ b:Int) -> Int64 {
    let maxNum = max(a,b), minNum = min(a,b)
    let count = maxNum - minNum + 1
    let result = (count * (minNum + maxNum)) / 2
        
//    let result = (min(a,b)...max(a,b)).reduce(0, +)
    
    return Int64(result)
}
