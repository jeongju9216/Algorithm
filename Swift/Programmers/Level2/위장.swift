//
//  위장.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/05/03.
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var dict: [String: [String]] = [:]
    
    for cloth in clothes {
        if let _ = dict[cloth[1]] {
            dict[cloth[1]]?.append(cloth[0])
        } else {
            dict[cloth[1]] = [cloth[0]]
        }
    }
    
    let count = dict.map { $0.value.count + 1 }.reduce(1, *)
    
    return count - 1
}
