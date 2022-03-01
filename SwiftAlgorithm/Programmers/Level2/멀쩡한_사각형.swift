//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/01.
//

import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    let w: Int64 = Int64(w)
    let h: Int64 = Int64(h)
    
    let wholeSquare = w * h
    
    //w * h는 공약수를 나눈 w' * h'로 축소 가능
    //w'와 h'가 서로소일 때 반대쪽 코너로 대각선을 그으면 w'-1개의 세로 선과 h'-1개의 가로 선을 지남
    //깨진 정사각형은 1 + (w'-1) + (h'-1) = w' + h' - 1임
    //공약수를 다시 곱해주면 w + h - gcd(w, h)가 됨
    let broken = w + h - gcd(w, h)
    
    return wholeSquare - broken
}

func gcd(_ a: Int64, _ b: Int64) -> Int64 {
    let maxNum = max(a, b)
    let minNum = min(a, b)
    
    let remain = maxNum % minNum
    return remain == 0 ? minNum : gcd(minNum, remain)
}

let w = 8, h = 12
print(solution(w, h))
