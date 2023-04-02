//
//  15652.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/02.
//

import Foundation

func dfs(_ current: [Int]) {
    if current.count == m {
        result += current.map { String($0) }.joined(separator: " ")
        result += "\n"
        return
    }
    
    for i in 1...n {
        guard let last = current.last else {
            dfs(current + [i])
            continue
        }
        
        if i >= last {
            dfs(current + [i])
        }
    }
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var result: String = ""

dfs([])

print(result)
