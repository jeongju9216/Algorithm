//
//  테이블 해시 함수.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/04.
//

import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    
    var sortedData = data.sorted { $0[col-1] != $1[col-1] ? $0[col-1] < $1[col-1] : $0[0] > $1[0]}
    
    var s: [Int] = []
    for i in row_begin...row_end {
        let index = i - 1
        var sum = 0
        for item in sortedData[index] {
            sum += item % i
        }
        s.append(sum)
    }
    
    var result = s[0]
    for i in 1..<s.count {
        result ^= s[i]
    }
    
    return result
}
