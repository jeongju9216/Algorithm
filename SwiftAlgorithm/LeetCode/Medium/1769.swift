//
//  1769.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/22.
//

import Foundation

class Solution {
    func minOperations(_ boxes: String) -> [Int] {
    
        var leftCount = 0, rightCount = 0

        var result: [Int] = [0]
        var arr: [Character] = Array(boxes)
        for i in 0..<arr.count {
            if arr[i] == "1" {
                result[0] += i
                rightCount += 1
            }
        }

        if arr[0] == "1" {
            leftCount += 1
            rightCount -= 1
        }

        for i in 1..<arr.count {
            let count = result[i-1] - rightCount + leftCount
            result.append(count)

            if arr[i] == "1" {
                rightCount -= 1
                leftCount += 1
            }
        }

        return result
    }
}
