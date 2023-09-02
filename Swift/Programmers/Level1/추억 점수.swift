//
//  추억 점수.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/31.
//

import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    
    var dict: [String: Int] = [:]
    for i in 0..<name.count {
        dict[name[i]] = yearning[i]
    }
    
    let result: [Int] = photo.map {
        $0.reduce(0) { $0 + (dict[$1] ?? 0) }
    }
    
    return result
}
