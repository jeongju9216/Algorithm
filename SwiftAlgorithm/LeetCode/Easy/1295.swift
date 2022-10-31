//
//  1295.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/25.
//

import Foundation

class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        return nums.filter { Array(String($0)).count % 2 == 0 }.count
    }
}
