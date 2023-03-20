//
//  10448.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/20.
//

import Foundation

func dfs(_ sum: Int, _ count: Int, _ target: Int) -> Bool {
    if count == 3 {
        return sum == target
    } else if count > 3 || sum > target {
        return false
    }
    
    var value = false
    for i in 1...target {
        let triNumber = i * (i + 1) / 2
        if sum + triNumber > target {
            break
        }
        
        value = dfs(sum + triNumber, count + 1, target)
        if value {
            break
        }
    }
    
    return value
}

let count = Int(readLine()!)!
for _ in 0..<count {
    let input = Int(readLine()!)!
    
    let result = dfs(0, 0, input)
    
    if result {
        print("1")
    } else {
        print("0")
    }
}
