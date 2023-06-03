//
//  마법의_엘리베이터.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/17.
//

import Foundation

func solution(_ storey: Int) -> Int {
    //일의 자리가 5 이상 -> 올림 -> 10 - 일의자리 차이만큼 돌 더함
    //일의 자리가 4 이하 -> 버림 -> 일의자리만큼 돌 더함
    //10으로 나눈 값 다시 반복
    var current = storey
    var result = 0
    while current > 0 {
        let lastItem = Int(String(String(current).last!))!
        current /= 10
        
        if lastItem > 5 {
            result += (10 - lastItem)
            current += 1
        } else if lastItem < 5 {
            result += lastItem
        } else {
            result += 5
            if current % 10 >= 5 {
                current += 1
            }
        }
    }
    
    return result
}
