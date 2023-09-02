//
//  크기가 작은 부분문자열.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/31.
//

import Foundation

func solution(_ t:String, _ p:String) -> Int {
    
    let arr = Array(t)
    let length = p.count
    let targetNum = Int(p)!
    
    var result = 0
    for i in 0...t.count-length {
        let number = Int(String(arr[i..<i+length]))!
        if number <= targetNum {
            result += 1
        }
    }
    
    return result
}
