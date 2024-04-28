//
//  대충 만든 자판.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2024/04/28.
//

import Foundation

func solution(_ keymap: [String], _ targets: [String]) -> [Int] {
    
    var dict: [Character: Int] = [:]
    for string in keymap {
        let chars = Array(string)
        for i in 0..<chars.count {
            let cur = dict[chars[i]] ?? Int.max
            dict[chars[i]] = min(i+1, cur)
        }
    }
    
    var result: [Int] = []
    for target in targets {
        var sum = 0
        for char in Array(target) {
            guard let num = dict[char] else {
                sum = -1
                break
            }
            sum += num
        }
        
        result.append(sum)
    }
    
    return result
}
