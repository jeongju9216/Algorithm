//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/27.
//

import Foundation

func solution(_ arr:[Int]) -> [Int] {
    let minNum = arr.min()
    
    let result = arr.filter { $0 != minNum }
    
    return result.isEmpty ? [-1] : result
}

let arr = [1, 2, 3]
print(solution(arr))
