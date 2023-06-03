//
//  1684.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/11.
//

import Foundation

class Solution {
    func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
        var result: Int = 0
        
        var allowedSet = Set(Array(allowed))
        var wordsSet = words.map { Set(Array($0)) }
        
        for words in wordsSet {
            var isCounting: Bool = true
            for word in words {
                if !allowedSet.contains(word) {
                    isCounting = false
                    break
                }
            }
            
            if isCounting {
                result += 1
            }
        }
        
        return result
    }
}
