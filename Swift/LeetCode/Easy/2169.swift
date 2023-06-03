//
//  2169.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/28.
//

import Foundation

class Solution {
    func countOperations(_ num1: Int, _ num2: Int) -> Int {
        //count를 세서
        //조건문으로 처리
        
        var count: Int = 0
        var num1 = num1, num2 = num2
        while num1 > 0 && num2 > 0 {
            if num1 > num2 {
                num1 = num1 - num2
            } else {
                num2 = num2 - num1
            }
            count += 1
        }
        
        return count
    }
}
