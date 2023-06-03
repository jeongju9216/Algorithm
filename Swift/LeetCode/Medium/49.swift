//
//  49.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/08/01.
//

import Foundation

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [String: [String]] = [:]
        
        for str in strs {
            let sortedStr = String(str.sorted())
            if dict[sortedStr] == nil {
                dict[sortedStr] = [str]
            } else {
                dict[sortedStr]?.append(str)
            }
        }
        
        var result: [[String]] = []
        for strs in dict {
            result.append(strs.value)
        }
        
        return result
    }
}
