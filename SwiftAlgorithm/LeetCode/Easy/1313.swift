//
//  1313.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/07.
//

import Foundation

class Solution {
    func decompressRLElist(_ nums: [Int]) -> [Int] {
        
        //0부터 2개씩 이어나가면서
        //앞의 수를 뒤의 수만큼 반복해서
        //result 배열에 추가
        var result: [Int] = []
        for i in stride(from: 0, to: nums.count-1, by: 2) {
            let times: Int = nums[i]
            let num: Int = nums[i+1]
            
            result.append(contentsOf: Array(repeating: num, count: times))
        }
        
        return result
    }
}
