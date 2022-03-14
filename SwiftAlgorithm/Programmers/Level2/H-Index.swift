//
//  H-Index.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/14.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    var citations = citations.sorted(by: >)
    
    for i in 0..<citations.count {
        if i >= citations[i] {
            return i
        }
    }
    
    return citations.count
}
