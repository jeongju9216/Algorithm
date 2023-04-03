//
//  1182.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/02.
//

import Foundation

func dfs(_ index: Int, _ sum: Int) {
    if index >= n {
        return
    }
    
    if sum + input[index] == s {
        result += 1
    }
    
    dfs(index + 1, sum + input[index])
    dfs(index + 1, sum)
}

let ns = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = ns[0], s = ns[1]
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }

var result = 0

dfs(0, 0)

print(result)
