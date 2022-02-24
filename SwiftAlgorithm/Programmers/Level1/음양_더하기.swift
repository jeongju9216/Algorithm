//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/22.
//

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var result = 0
    
    for (index, number) in absolutes.enumerated() {
        if signs[index] {
            result += number
        } else {
            result -= number
        }
    }
    
    return result
}

let absolutes = [4,7,12]
let signs = [true,false,true]

print(solution(absolutes, signs))
