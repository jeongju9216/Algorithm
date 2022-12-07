//
//  숫자 카드 나누기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/07.
//

import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    let maxNum: Int = max(a, b)
    let minNum: Int = min(a, b)
    
    let remain: Int = maxNum % minNum
    
    return remain == 0 ? minNum : gcd(minNum, remain)
}

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    
    //양쪽의 최대공약수 중 최댓값
    var gcdA: Int = arrayA[0], gcdB: Int = arrayB[0]
    for i in 1..<arrayA.count {
        gcdA = gcd(gcdA, arrayA[i])
        gcdB = gcd(gcdB, arrayB[i])
    }
    
    let isA = (arrayA.filter { $0 % gcdB == 0 }.count == 0) //B의 gcd가 A와 하나도 안 나눠져야 함
    let isB = (arrayB.filter { $0 % gcdA == 0 }.count == 0) //A의 gcd가 B와 하나도 안 나눠져야 함
    
    var result: Int = 0
    if isA && isB {
        result = max(gcdA, gcdB)
    } else if isA {
        result = gcdB
    } else if isB {
        result = gcdA
    } else {
        result = 0
    }
    
    return result
}
