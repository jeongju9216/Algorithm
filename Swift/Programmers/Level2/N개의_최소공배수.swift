//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/05.
//

import Foundation

func solution(_ arr:[Int]) -> Int {
    //return arr.reduce(1) { lcm($0, $1) } //0.02 ~ 0.03ms
    return (1..<arr.count).reduce(arr.first!) { lcm($0, arr[$1]) } //0.06 ~ 0.11ms
}

func gcd(_ a: Int, _ b : Int) -> Int {
    let maxNum = max(a, b)
    let minNum = min(a, b)
    
    let remain = maxNum % minNum
    return remain == 0 ? minNum : gcd(minNum, remain)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

let arr = [2,6,8,14]
print(solution(arr))
