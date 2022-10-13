//
//  1342.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/09.
//

import Foundation

class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var num = num
        var count: Int = 0
        
        while num != 0 {
            if num % 2 == 0 {
                num /= 2
            } else {
                num -= 1
            }
            
            count += 1
        }
        
        return count
    }
}
