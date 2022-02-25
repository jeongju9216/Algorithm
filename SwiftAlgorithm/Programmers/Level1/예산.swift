//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/25.
//

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var result: Int = 0
    
    var budget = budget
    result = d.sorted().filter {
        budget -= $0
        return budget >= 0
    }.count
    
    return result
}

let d = [1,3,2,5,4]
let budget = 9
print(solution(d, budget))
