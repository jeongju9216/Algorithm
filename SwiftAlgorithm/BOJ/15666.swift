//
//  15666.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/02.
//

import Foundation

func dfs(_ arr: [String]) {
    if arr.count == nm[1] {
        if !arrs.contains(arr) {
            arrs.insert(arr)
            result += arr.joined(separator: " ") + "\n"
        }
        
        return
    }
    
    for i in 0..<input.count {
        guard let last = arr.last, let number = Int(last) else {
            dfs(arr + [String(input[i])])
            continue
        }
        
        if number <= input[i] {
            dfs(arr + [String(input[i])])
        }
    }
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()

var arrs: Set<[String]> = []

var result: String = ""
dfs([])

print(result)
