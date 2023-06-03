//
//  9.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/16.
//

import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let input: [Character] = Array(String(x))
        
        return (input == input.reversed())
    }
}
