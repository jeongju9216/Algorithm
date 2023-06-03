//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/27.
//

func solution(_ num:Int) -> Int {
    var num = num
    
    var count: Int = 0
    while num != 1 {
        if count >= 500 {
            break
        }
        
        num = (num % 2 == 0) ? (num / 2) : (num * 3 + 1)
        count += 1
    }
    
    return num == 1 ? count : -1
}
