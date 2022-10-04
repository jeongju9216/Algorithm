//
//  1720.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/04.
//

import Foundation

class Solution {
    func decode(_ encoded: [Int], _ first: Int) -> [Int] {
        var result: [Int] = [first]
        for i in 0..<encoded.count {
            result.append(encoded[i] ^ result[i])
        }
        
        return result
    }
}
