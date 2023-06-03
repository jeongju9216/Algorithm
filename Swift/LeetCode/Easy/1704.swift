//
//  1704.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/24.
//

import Foundation

class Solution {
    func halvesAreAlike(_ s: String) -> Bool {
        var dict: [Character: Int] = ["a": 0, "e": 0, "i": 0, "o": 0, "u": 0]
        var count: Int = 0
        
        var chars: [Character] = Array(s.lowercased())
        
        for i in 0..<chars.count {
            guard let _ = dict[chars[i]] else {
                continue
            }
            
            if i < (s.count/2) {
                count += 1
            } else {
                count -= 1
            }
        }
        
        return (count == 0)
    }
}
