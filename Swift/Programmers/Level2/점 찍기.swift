//
//  점 찍기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/12/06.
//

import Foundation

import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var result: Int64 = 0
    for i in stride(from: 0, to: d+1, by: k) { //x를 k씩 움직이면서 체크
        //거리가 d가 되는 최대 y를 구함
        let maxY: Int64 = Int64(sqrt(pow(Double(d), 2.0) - pow(Double(i), 2.0)))
        //k로 나눠서 사이의 y 좌표 개수를 구함
        result += (maxY / Int64(k) + 1)
    }
    
    return result
}
