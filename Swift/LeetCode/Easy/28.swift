//
//  28.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/04.
//

import Foundation

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty { return 0 }
        if haystack.count < needle.count { return -1 }
        
        if let range = haystack.range(of: needle) {
            return haystack.distance(from: haystack.startIndex, to: range.lowerBound)
        } else {
            return -1
        }
    }
}
