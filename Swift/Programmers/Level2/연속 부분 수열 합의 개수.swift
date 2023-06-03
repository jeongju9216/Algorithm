//
//  연속 부분 수열 합의 개수.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/06.
//

import Foundation

func solution(_ elements:[Int]) -> Int {
    var result: Set<Int> = []
    
    for size in 1...elements.count { //1개 ~ n개
        for i in 0..<elements.count {
            var sum: Int = 0
            for j in i..<(i+size) {
                sum += elements[j % elements.count]
            }
            result.insert(sum)
        }
    }
    
    return result.count
}
