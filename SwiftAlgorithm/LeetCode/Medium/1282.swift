//
//  1282.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/08.
//

import Foundation

class Solution {
    func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
        //정렬해서 순서대로 쌓는다
        var sortedGroups: [(idx: Int, size: Int)] = []
        for i in 0..<groupSizes.count {
            sortedGroups.append((i, groupSizes[i]))
        }
        
        sortedGroups = sortedGroups.sorted { $0.1 < $1.1 }
        
        var result: [[Int]] = []
        for group in sortedGroups {
            result.append((result.popLast() ?? []) + [group.idx] )
            
            if let last = result.last, last.count >= group.size {
                result.append([])
            }
        }
        result.removeLast()
        
        return result
    }
}
