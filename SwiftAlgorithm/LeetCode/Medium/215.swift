//
//  215.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/17.
//

import Foundation

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        return (nums.sorted(by: >))[k-1]
    }
}
