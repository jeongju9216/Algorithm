//
//  1967.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/11/01.
//

import Foundation

class Solution {
    func numOfStrings(_ patterns: [String], _ word: String) -> Int {
        
        var result: Int = 0
        for str in patterns {
            if word.contains(str) {
                result += 1
            }
        }
        
        return result
    }
}
