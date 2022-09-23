//
//  1528.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/22.
//

import Foundation

class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        let chars: [Character] = Array(s)
        var result: [Character] = chars

        for i in 0..<indices.count {
            result[indices[i]] = chars[i]
        }

        return String(result)
    }
}
