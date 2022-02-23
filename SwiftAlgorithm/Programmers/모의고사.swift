//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/23.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var result: [Int] = []
    
    let persons = [[1, 2, 3, 4, 5],
                  [2, 1, 2, 3, 2, 4, 2, 5],
                  [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]]
    
    let grades = [1: marking(persons[0], answers: answers),
                  2: marking(persons[1], answers: answers),
                  3: marking(persons[2], answers: answers)]
        
    result = grades.sorted { $0.key < $1.key }
                .filter { $0.value == grades.values.max() }
                .map { $0.key }
    
    return result
}

func marking(_ array: [Int], answers: [Int]) -> Int {
    return (0..<answers.count).filter {
        answers[$0] == array[$0 % array.count]
    }.count
}

let answers = [1,3,2,4,2]
print(solution(answers))
