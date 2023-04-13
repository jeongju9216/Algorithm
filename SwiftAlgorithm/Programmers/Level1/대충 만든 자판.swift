//
//  대충 만든 자판.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/13.
//

import Foundation

//딕셔너리에 터치 min값을 넣음
//그 딕셔너리에서 Int값을 꺼내서 더함
//딕셔너리에 없으면 -1

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    
    var dict: [Character: Int] = [:]
    for km in keymap {
        let chars = Array(km)
        for i in 0..<chars.count {
            let cur = dict[chars[i]] ?? Int.max
            dict[chars[i]] = min(i+1, cur)
        }
    }
    
    var result: [Int] = []
    for target in targets {
        var sum = 0
        let arr = Array(target)
        for char in arr {
            if let num = dict[char] {
                sum += num
            } else {
                sum = -1
                break
            }
        }
        
        result.append(sum)
    }
    
    return result
}
