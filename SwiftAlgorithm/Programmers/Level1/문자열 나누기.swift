//
//  문자열 나누기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/14.
//

import Foundation

func solution(_ s:String) -> Int {
    var arr = Array(s).map { String($0) }
    var x = ""
    
    var count1 = 0, count2 = 0
    var result = 0
    for i in 0..<arr.count {
        if x.isEmpty {
            x = arr[i]
            count1 = 1
            count2 = 0
            continue
        }
        
        if x == arr[i] {
            count1 += 1
        } else {
            count2 += 1
        }
        
        if count1 == count2 {
            result += 1
            x = ""
        }
    }
    
    if !x.isEmpty {
        result += 1
    }
    
    return result
}
