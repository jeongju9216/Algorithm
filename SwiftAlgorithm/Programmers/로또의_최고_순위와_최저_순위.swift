//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/21.
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var zeroCount = 0, sameCount = 0
    for number in lottos {
        if number == 0 {
            zeroCount += 1
        } else {
            for winNum in win_nums {
                if number == winNum {
                    sameCount += 1
                }
            }
        }
    }
    
    let minGrade = 6 - sameCount + 1
    let maxGrade = minGrade - zeroCount
    
    return [min(maxGrade, 6), min(minGrade, 6)]
}

let lottos = [1, 2, 3, 4, 5, 6]
let win_nums = [7, 8, 9, 10, 11, 12]

print(solution(lottos, win_nums))
