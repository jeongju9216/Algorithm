//
//  2000.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/20.
//

import Foundation

class Solution {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        var chars: [Character] = Array(word)
        var stack: [Character] = []

        var flag: Bool = true
        for i in 0..<chars.count {
            if flag && chars[i] == ch {
                flag = false
                
                stack.append(chars[i])
                stack = stack.reversed()
            } else {
                stack.append(chars[i])
            }
        }
        
        return String(stack)
    }
}
