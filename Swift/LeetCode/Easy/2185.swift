//
//  2185.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/25.
//

import Foundation

class Solution {
    func prefixCount(_ words: [String], _ pref: String) -> Int {
        return words.filter { $0.hasPrefix(pref) }.count
    }
}
