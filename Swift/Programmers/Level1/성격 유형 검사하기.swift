//
//  성격 유형 검사하기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/14.
//

import Foundation

var dict: [String: Int] = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]

func getString(_ id1: String, _ id2: String) -> String {
    let score1 = dict[id1]!
    let score2 = dict[id2]!
    if score1 < score2 {
        return id2
    } else if score1 > score2 {
        return id1
    } else {
        return min(id1, id2)
    }
}

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var length = survey.count
    
    for i in 0..<length {
        let choice = choices[i] - 4
        
        let items = Array(survey[i]).map { String($0) }
        if choice < 0 {
            dict[items[0]]! += abs(choice)
        } else {
            dict[items[1]]! += choice
        }
    }
    
    let item1 = getString("R", "T")
    let item2 = getString("C", "F")
    let item3 = getString("J", "M")
    let item4 = getString("A", "N")
    
    let result = item1 + item2 + item3 + item4
    
    return result
}
