//
//  콜라 문제.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/06.
//

import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    
    var n = n
    var result: Int = 0
    while n >= a {
        let div = n / a
        let remain = n % a
        
        n = div * b + remain
        
        result += (div * b)
    }
    
    return result
}
