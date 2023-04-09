//
//  연속된 부분 수열의 합.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/09.
//

import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    
    var left = 0, right = 0
    var sum = sequence[0]
    var result: [Int] = [0, sequence.count]
    while left <= right {
        if sum == k {
            if right - left < result[1] - result[0] {
                result = [left, right]
            }
            
            sum -= sequence[left]
            left += 1
        } else if sum < k {
            if right + 1 < sequence.count {
                right += 1
                sum += sequence[right]
            } else {
                sum -= sequence[left]
                left += 1
            }
        } else if sum > k {
            sum -= sequence[left]
            left += 1
        }
    }
    
    return result
}
