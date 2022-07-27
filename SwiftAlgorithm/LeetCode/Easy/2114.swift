//
//  2114.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/07/27.
//

import Foundation

class Solution {
    func mostWordsFound(_ sentences: [String]) -> Int {
        var result: Int = 0
        sentences.map {
            let count: Int = $0.split { $0 == " " }.count
            result = max(result, count)
        }
        
        return result
    }
}
