//
//  131.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/02.
//

import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        return (s == String(s.reversed()))
    }
    
    func backtracking(_ result: inout [[String]], _ path: inout [String], _ s: inout [Character], _ index: Int) {
        if index == s.count {
            result.append(Array(path))
            return
        }
        
        for i in index..<s.count {
            let current: String = String(s[index...i])
            
            if isPalindrome(current) {
                path.append(current)
                backtracking(&result, &path, &s, i + 1)
                path.removeLast()
            }
        }
    }
    
    func partition(_ s: String) -> [[String]] {
        
        var chars: [Character] = Array(s)
        var result: [[String]] = []
        var path: [String] = []
        
        backtracking(&result, &path, &chars, 0)
        
        return result
    }
}
