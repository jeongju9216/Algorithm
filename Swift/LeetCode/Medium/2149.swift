//
//  2149.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/18.
//

import Foundation

class Solution {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        //양의 정수 배열, 음의 정수 배열 생성
        //nums를 탐색하면서 하나씩 넣기
        
        var positiveArray: [Int] = []
        var negativeArray: [Int] = []
        
        for num in nums {
            if num >= 0 {
                positiveArray.append(num)
            } else {
                negativeArray.append(num)
            }
        }
        
        var result: [Int] = []
        for i in 0..<(nums.count/2) {
            result.append(positiveArray[i])
            result.append(negativeArray[i])
        }
        
        return result
    }
}
