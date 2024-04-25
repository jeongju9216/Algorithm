//
//  숫자_변환하기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2024/04/25.
//

import Foundation

func solution(_ x: Int, _ y: Int, _ n: Int) -> Int {
    
    var queue: [(Int, Int)] = [(y, 0)]
    var index = 0
    var visited: Set<Int> = []
    
    var result = Int.max
    while index < queue.count {
        let (number, count) = queue[index]
        index += 1
        
        if number == x {
            result = min(result, count)
            break
        } else if number < x {
            continue
        }
        
        if !visited.contains(number - n) {
            queue.append((number - n, count + 1))
        }
        
        if !visited.contains(number / 2) && number % 2 == 0 {
            queue.append((number / 2, count + 1))
        }
        
        if !visited.contains(number / 3) && number % 3 == 0 {
            queue.append((number / 3, count + 1))
        }
        
        visited.insert(number)
    }
    
    return result == Int.max ? -1 : result
}
