//
//  1630.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/23.
//

import Foundation

class Solution {
    func checkArithmeticSubarrays(_ nums: [Int], _ l: [Int], _ r: [Int]) -> [Bool] {
        //l[i]...r[i]가 arithmetic인지 판단
        
        var result: [Bool] = []
        //범위로 잘라서 정렬
        //정렬한 거의 첫 번째 차를 구함
        //차가 모두 일정한지 체크
        
        for time in 0..<l.count {
            let left = l[time]
            let right = r[time]
            
            let newArray: [Int] = Array(nums[left...right]).sorted()
            let diff: Int = newArray[1] - newArray[0]
            
            var isArithmetic = true
            for i in 1..<newArray.count {
                if newArray[i] - newArray[i-1] != diff {
                    isArithmetic = false
                    break
                }
            }
            
            result.append(isArithmetic)
        }
        
        return result
    }
}
