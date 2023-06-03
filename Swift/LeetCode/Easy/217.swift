//
//  217.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/09.
//

import Foundation

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var cache: [Int: Bool] = [:]
        
        for num in nums {
            if let cache = cache[num] {
                return true
            }
            cache[num] = true
        }
        
        return false
    }
}
