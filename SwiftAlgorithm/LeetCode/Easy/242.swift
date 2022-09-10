//
//  242.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/09.
//

import Foundation

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let sArr: [Character] = Array(s).sorted()
        let tArr: [Character] = Array(t).sorted()
        
        return (sArr == tArr)
    }
}
