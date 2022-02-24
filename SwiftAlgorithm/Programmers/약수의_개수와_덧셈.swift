//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/23.
//

import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    let result = (left...right).map { i in
        let count = (1...i).filter { (i % $0) == 0 }.count
        return (count % 2 == 0) ? i : -i
    }.reduce(0, +)
    
    return result
}

let left = 13, right = 17
print(solution(left, right))
