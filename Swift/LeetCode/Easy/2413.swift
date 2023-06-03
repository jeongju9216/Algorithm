//
//  2413.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/10/04.
//

import Foundation

class Solution {
    func smallestEvenMultiple(_ n: Int) -> Int {
        var num: Int = n
        while num % 2 != 0 || num % n != 0 {
            num += 1
        }
        
        return num
    }
}
