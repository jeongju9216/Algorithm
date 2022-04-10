//
//  점프와_순간_이동.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/10.
//

import Foundation

func solution(_ n:Int) -> Int {
    var ans:Int = 0
    
    var n = n
    while n > 0 {
        ans += (n % 2)
        n = (n % 2 == 0) ? n/2 : n-1
    }
    
    return ans
}
