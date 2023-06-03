//
//  832.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/27.
//

import Foundation

class Solution {
    func flipAndInvertImage(_ image: [[Int]]) -> [[Int]] {
        let result: [[Int]] = image.map {
            $0.reversed().map { $0 == 0 ? 1 : 0 }
        }
        
        return result
    }
}
