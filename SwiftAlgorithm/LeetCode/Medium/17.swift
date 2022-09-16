//
//  17.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/16.
//

import Foundation

class Solution {
    
    let phone: [Int: [Character]] = [
        2: ["a", "b", "c"],
        3: ["d", "e", "f"],
        4: ["g", "h", "i"],
        5: ["j", "k", "l"],
        6: ["m", "n", "o"],
        7: ["p", "q", "r", "s"],
        8: ["t", "u", "v"],
        9: ["w", "x", "y", "z"]
    ]
    
    func combination(_ digits: String) -> [String] {
        var result: [String] = []
        var length: Int = digits.count
        var digits: [Character] = Array(digits)
        
        func combi(_ arr: [Character]) {
            let arrLength: Int = arr.count
            if arrLength == length {
                result.append(String(arr))
                return
            }
            
            let digit = Int(String(digits[arrLength]))!
            for char in phone[digit]! {
                combi(arr + [char])
            }
        }
        
        combi([])
        
        return result
    }
    
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        
        let result = combination(digits)
        
        return result
    }
}
