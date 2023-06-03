//
//  125.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/08.
//

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let newS = Array(s.lowercased().replacingOccurrences(of: "[^a-z0-9]", with: "", options: .regularExpression))
        print(newS)
        
        let len: Int = newS.count
        for i in 0..<(len/2) {
            if newS[i] != newS[len-1-i] {
                return false
            }
        }
        
        return true
    }
}
