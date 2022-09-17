//
//  205.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/16.
//

import Foundation

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var dict: [Character: Character] = [:]
        
        var arr1: [Character] = Array(s)
        var arr2: [Character] = Array(t)
        
        for i in 0..<arr1.count {
            if let cache = dict[arr1[i]] { //해시에 키가 있을 때
                if cache != arr2[i] {
                    return false
                }
            } else { //해시에 키가 없을 때
                if dict.values.contains(arr2[i]) {
                    return false
                }
                
                dict[arr1[i]] = arr2[i]
            }
        }
        
        return true
    }
}
