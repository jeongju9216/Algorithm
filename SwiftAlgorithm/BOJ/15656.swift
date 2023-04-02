//
//  15656.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/02.
//

import Foundation

func dfs(_ indexs: [String]) {
    if indexs.count == nm[1] {
        result += (indexs.joined(separator: " ") + "\n")
        return
    }
    
    for i in 0..<nm[0] {
        dfs(indexs + [String(input[i])])
    }
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()

var result: String = ""

dfs([])

print(result)
