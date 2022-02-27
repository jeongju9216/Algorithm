//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/27.
//

import Foundation

func solution(_ n:Int) -> Int
{
    var answer:Int = 0
    
    //1
//    var n = n
//    while n > 0 {
//        answer += (n % 10)
//        n = n / 10
//    }
    
    //2
    answer = String(n).reduce(0) {
        $0 + Int(String($1))!
    }
    
    return answer
}
