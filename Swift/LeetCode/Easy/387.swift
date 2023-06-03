//
//  387.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/10.
//

import Foundation

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        let s: [Character] = Array(s)
        var dict: [Character: (cnt: Int, idx: Int)] = [:]
        
        for (i, char) in s.enumerated() {
            if let cache = dict[char] {
                dict[char] = (cache.cnt+1, cache.idx)
            } else {
                dict[char] = (1, i)
            }
        }
        
        var minIndex = -1
        for item in dict {
            if item.value.cnt == 1 {
                minIndex = (minIndex != -1) ? min(item.value.idx, minIndex) : item.value.idx
            }
        }
        
        return minIndex
    }
}
