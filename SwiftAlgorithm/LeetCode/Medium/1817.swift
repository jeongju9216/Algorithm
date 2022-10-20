//
//  1817.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/19.
//

import Foundation

class Solution {
    func findingUsersActiveMinutes(_ logs: [[Int]], _ k: Int) -> [Int] {
        
        //dictionary로 id: Set[Action]
        //UAM => value 개수
        
        var dict: [Int: Set<Int>] = [:]
        for log in logs {
            dict[log[0], default: []].insert(log[1])
        }
        
        var result: [Int] = Array(repeating: 0, count: k)
        for actions in dict.values {
            result[actions.count-1] += 1
        }
        
        return result
    }
}
