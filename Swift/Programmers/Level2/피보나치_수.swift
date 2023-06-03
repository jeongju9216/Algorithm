//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/05.
//

import Foundation

func solution(_ n:Int) -> Int {
    var fibo: [Int] = [0, 1]
    
    for i in 2...n {
        fibo.append((fibo[i-1] + fibo[i-2]) % 1234567)
    }

    return fibo.last!
}
