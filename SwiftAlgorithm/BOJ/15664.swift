//
//  15664.swift
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
        if !visited[i] {
            visited[i] = true
            
            guard let last = arr.last, let number = Int(last) else {
                dfs(arr + [String(input[i])])
                visited[i] = false
                continue
            }
            
            if number <= input[i] {
                dfs(arr + [String(input[i])])
            }
            
            visited[i] = false
        }
    }
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()

var visited: [Bool] = Array(repeating: false, count: input.count)
var arrs: Set<[String]> = []

var result: String = ""
dfs([])

print(result)
