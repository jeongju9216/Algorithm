//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/27.
//

import Foundation

func solution(_ dartResult:String) -> Int {
    var scores: [Int] = []
    var stacks: [String] = []
    
    for n in dartResult {
        if n.isNumber {
            stacks.append(String(n))
        } else {
            var numString = ""
            while true {
                guard let top = stacks.last, let _ = Int(top) else {
                    break
                }
                
                stacks.removeLast()
                numString += top
            }

            if numString.isEmpty {
                if let top = stacks.popLast() {
                    stacks.append(top + String(n))
                }
            } else {
                stacks.append(String(n))
                scores.append(Int(String(numString.reversed()))!)
            }
        }
    }
    
    for (index, stack) in stacks.enumerated() {

        stack.forEach {
            switch $0 {
            case "S":
                scores[index] = Int(pow(Double(scores[index]), 1))
            case "D":
                scores[index] = Int(pow(Double(scores[index]), 2))
            case "T":
                scores[index] = Int(pow(Double(scores[index]), 3))
            case "*":
                scores[index] = 2 * scores[index]
                if index - 1 >= 0 {
                    scores[index - 1] = 2 * scores[index - 1]
                }
            case "#":
                scores[index] = -(scores[index])
            default:
                break
            }
        }
    }
        
    return scores.reduce(0, +)
}

let dartResult = "1D2S#10S"
print(solution(dartResult))
