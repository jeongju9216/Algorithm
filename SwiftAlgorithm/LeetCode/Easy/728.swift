//
//  728.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/21.
//

import Foundation

class Solution {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        var result: [Int] = []
        var index = left
        while index <= right {
            //배열에 0이 들어있으면 continue
            var num = index
            while num > 0 {
                let di = num % 10
                
                if di == 0 || index % di > 0 {
                    break
                }
                
                num /= 10
            }
            
            if num == 0 {
                result.append(index)
            }
            
            index += 1
        }
        
        return result
    }
}
