//
//  추억 점수.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/13.
//

import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    
    var dict: [String: Int] = [:]
    for i in 0..<name.count {
        dict[name[i]] = yearning[i]
    }
    
    var result: [Int] = []
    for pt in photo {
        var sum = 0
        pt.forEach { sum += dict[$0] ?? 0 }
        result.append(sum)
    }
    
    return result
}
