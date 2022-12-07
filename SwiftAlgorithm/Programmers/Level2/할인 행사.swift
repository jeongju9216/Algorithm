//
//  할인 행사.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/07.
//

import Foundation

import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    
    //want 하나하나 남은 양이 0이 되는 순간을 봄
    //10개씩 체크 ->
    var dict: [String: Int] = [:]
    for i in 0..<want.count {
        dict[want[i]] = number[i]
    }
    
    var result: Int = 0
    
    var left: Int = 0
    while (left + 9) < discount.count {
        let sub: [String] = Array(discount[left...(left+9)])
        var copyDict = dict
        
        for item in sub {
            if copyDict[item] != nil {
                copyDict[item]! -= 1
            }
        }
        
        if copyDict.values.filter { $0 > 0 }.count == 0 {
            result += 1
        }
        
        left += 1
    }
    
    return result
}
