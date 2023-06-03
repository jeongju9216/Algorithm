//
//  42.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/03.
//

import Foundation

class Solution {
    func trap(_ height: [Int]) -> Int {
        guard height.count >= 3 else {
            return 0
        }
        
        //한 줄 한 줄 확인
        //왼쪽 최대 높이와 오른쪽 최대 높이를 구함
        //두 값 중 최소값 - 현재 위치 높이
        
        var sum: Int = 0
        //1~n-1까지만 확인
        for i in 1..<height.count-1 {
            let left = height[0...i-1].max()!
            let right = height[i+1...height.count-1].max()!
            
            let diff = min(left, right) - height[i]
            sum += max(diff, 0)
        }
        
        return sum
    }
}
