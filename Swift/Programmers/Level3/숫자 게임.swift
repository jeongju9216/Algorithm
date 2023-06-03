//
//  숫자 게임.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/06.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    let sortedA = a.sorted(by: >)
    let sortedB = b.sorted(by: >)
    
    var result = 0
    var index = 0
    for i in 0..<a.count {
        if sortedA[i] < sortedB[index] {
            result += 1
            index += 1
        }
    }
    
    return result
}
