//
//  영어_끝말잇기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/10.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var answers: [String: Int] = [:]
    answers.updateValue(1, forKey: words[0])
    for i in 1..<words.count {
        // let startIndex = words[i].startIndex
        // let endIndex = words[i-1].index(before: words[i-1].endIndex)
        
        if answers[words[i]] == 1 || (words[i-1].last! != words[i].first!) {
            return [i%n + 1, i/n + 1]
        }
        
        answers.updateValue(1, forKey: words[i])
    }

    return [0, 0]
}
