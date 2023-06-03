//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/27.
//

func solution(_ dartResult:String) -> Int {
    var scores = dartResult.split(whereSeparator: { !$0.isNumber }).compactMap { Int($0) }
    let letters = dartResult.split(whereSeparator: { $0.isNumber })
    
    for (index, letter) in letters.enumerated() {
        letter.forEach {
            let score = scores[index]
            switch $0 {
            case "D":
                scores[index] = score * score
            case "T":
                scores[index] = score * score * score
            case "*":
                scores[index] = 2 * score
                if index - 1 >= 0 {
                    scores[index - 1] = 2 * scores[index - 1]
                }
            case "#":
                scores[index] = -score
            default:
                break
            }
        }
    }
        
    return scores.reduce(0, +)
}

let dartResult = "1D2S#10S*"
print(solution(dartResult))
