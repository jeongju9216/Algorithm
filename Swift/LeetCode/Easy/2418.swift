//
//  2418.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/06.
//

import Foundation

class Solution {
    func sortPeople(_ names: [String], _ heights: [Int]) -> [String] {
        var tuples: [(String, Int)] = []
        for i in 0..<names.count {
            tuples.append((names[i], heights[i]))
        }
        
        tuples = tuples.sorted { $0.1 > $1.1 }
        
        let result: [String] = tuples.map { $0.0 }
        
        return result
    }
}
