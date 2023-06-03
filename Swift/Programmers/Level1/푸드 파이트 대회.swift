//
//  푸드 파이트 대회.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/06.
//

import Foundation

func solution(_ food:[Int]) -> String {
    
    var result = ""
    for i in 1..<food.count {
        var count = food[i]
        if count % 2 != 0 {
            count -= 1
        }
        count /= 2
        
        result += String(repeating: "\(i)", count: count)
    }
    
    result = result + "0" + result.reversed()
    
    return result
}
