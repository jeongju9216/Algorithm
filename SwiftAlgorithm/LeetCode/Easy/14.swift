//
//  14.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/04.
//

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        let sortedStrs: [String] = strs.sorted { $0.count < $1.count }
        var longestPrefix = sortedStrs[0]
        
        for str in sortedStrs {
            while !str.hasPrefix(longestPrefix) {
                longestPrefix.removeLast()
                if longestPrefix.isEmpty {
                    return longestPrefix
                }
            }
        }
        
        return longestPrefix
    }
}
