//
//  378.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/03.
//

import Foundation

class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        let flatArr: [Int] = matrix.flatMap { $0 }.sorted(by: <)
        
        return flatArr[k-1]
    }
}
