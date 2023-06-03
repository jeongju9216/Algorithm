//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/27.
//

import Foundation

class Solution {
    func defangIPaddr(_ address: String) -> String {
        return address.replacingOccurrences(of: ".", with: "[.]")
    }
}
// Runtime: 0 ms, faster than 100.00% of Swift online submissions for Defanging an IP Address.
// Memory Usage: 15 MB, less than 25.93% of Swift online submissions for Defanging an IP Address.

