//
//  1221.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/09/21.
//

import Foundation

class Solution {
    func balancedStringSplit(_ s: String) -> Int {
        var s: [Character] = Array(s)
        
        var result: Int = 0
        var countL = 0, countR = 0
        //시작부터 카운트하면서 L, R의 카운트가 같아지면
        //카운트 리셋, result += 1
        
        for char in s {
            if char == "L" {
                countL += 1
            } else {
                countR += 1
            }
            
            if countL == countR {
                result += 1
                countL = 0
                countR = 0
            }
        }
        
        
        return result
    }
}
