//
//  1832.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/31.
//

import Foundation

class Solution {
    func checkIfPangram(_ sentence: String) -> Bool {
        var alphabet: [Character: Int] = [:]
        for char in "abcdefghijklmnopqrstuvwxyz" {
            alphabet[char] = 0
        }
        
        for char in sentence {
            alphabet[char]? += 1
        }
        
        return alphabet.values.filter { $0 == 0 }.count == 0
    }
}
