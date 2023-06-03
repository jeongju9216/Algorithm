//
//  1773.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/22.
//

import Foundation

class Solution {
    func countMatches(_ items: [[String]], _ ruleKey: String, _ ruleValue: String) -> Int {
        var index: Int = 0

        switch ruleKey {
        case "type":
            index = 0
        case "color":
            index = 1
        case "name":
            index = 2
        default: return 0
        }

        var count: Int = 0
        for i in 0..<items.count {
            if items[i][index] == ruleValue {
                count += 1
            }
        }

        return count
    }
}
