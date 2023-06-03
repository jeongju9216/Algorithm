//
//  이진_변환_반복하기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/10.
//

import Foundation

func solution(_ s:String) -> [Int] {
    
    var s = s
    var count = 0, times = 0
    while s != "1" {
        let replaceCount = s.filter { $0 == "0" }.count
        count += replaceCount

        s = String(s.count - replaceCount, radix: 2)
        times += 1
    }
    
    return [times, count]
}
