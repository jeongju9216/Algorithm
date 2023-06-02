//
//  15655.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/02.
//

import Foundation

func dfs(_ indexs: [Int]) {
    if indexs.count == nm[1] {
        result += (indexs.map { String(input[$0]) }.joined(separator: " ") + "\n")
        return
    }
    
    for i in 0..<nm[0] {
        guard let last = indexs.last else {
            dfs(indexs + [i])
            continue
        }
        
        if !indexs.contains(i) && input[last] < input[i] {
            dfs(indexs + [i])
        }
    }
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()

var result: String = ""

dfs([])

print(result)
