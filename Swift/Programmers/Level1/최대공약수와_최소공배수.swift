//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/02/27.
//

import Foundation

func solution(_ n:Int, _ m:Int) -> [Int] {
    return [gcd(n, m), lcm(n, m)]
}

func gcd(_ a: Int, _ b: Int) -> Int {
    let maxNum = max(a, b)
    let minNum = min(a, b)
    
    let remain = maxNum % minNum
    return remain == 0 ? minNum : gcd(minNum, remain)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

let n=2, m=5
print(solution(n, m))
