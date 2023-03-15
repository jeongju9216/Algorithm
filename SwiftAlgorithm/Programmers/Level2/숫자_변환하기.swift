//
//  숫자_변환하기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/15.
//

import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    
    var queue: [(Int, Int)] = [(y, 0)]
    var index = 0
    var visited: Set<Int> = []
    
    var minCount = Int.max
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        let number = node.0
        let count = node.1
                
        if number == x {
            minCount = min(minCount, count)
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
    
    return minCount == Int.max ? -1 : minCount
}
