//
//  2194.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/22.
//

import Foundation

class Solution {
    func cellsInRange(_ s: String) -> [String] {
        let arr: [[Character]] = s.components(separatedBy: ":").map { Array($0) }
    
        let startCol: Int = Int(UnicodeScalar(String(arr[0][0]))!.value)
        let startRow: Int = Int(UnicodeScalar(String(arr[0][1]))!.value)

        let endCol: Int = Int(UnicodeScalar(String(arr[1][0]))!.value)
        let endRow: Int = Int(UnicodeScalar(String(arr[1][1]))!.value)

        var result: [String] = []
        for col in startCol...endCol {
            var str: String = "\(UnicodeScalar(col)!)"

            for row in startRow...endRow {
                result.append(str + "\(UnicodeScalar(row)!)")
            }
        }

        return result
    }
}
