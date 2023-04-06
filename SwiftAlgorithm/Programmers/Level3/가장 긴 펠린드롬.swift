//
//  가장 긴 펠린드롬.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/06.
//

import Foundation

func solution(_ s:String) -> Int {
    if s.count == 1 {
        return 1
    }

    let arr = Array(s)
    var result = 0
    for i in 0..<arr.count-1 {
        var tmp: [Character] = []
        for j in (i+1..<arr.count).reversed() where j - i + 1 > result {
            var length = j - i + 1
            
            for m in 0...length / 2 {
                //왼쪽은 첫번째부터 오른쪽은 마지막부터 비교
                if arr[i + m] != arr[j - m] {
                    length = 0
                    break
                }
            }
            
            if length == j - i + 1 {
                result = max(result, length)
            }
        }
    }
    
    return result
}
