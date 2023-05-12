//
//  1038.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/12.
//

import Foundation

func dfs(_ current: [String]) {
    if !current.isEmpty {
        result.append(current.joined())
    }
    
    for num in 0...9 {
        if current.isEmpty {
            if num > 0 {
                dfs(current + [String(num)])
            }
        } else {
            if Int(current.last!)! > num {
                dfs(current + [String(num)])
            }
        }
    }
}

let n = Int(readLine()!)!
if n >= 1023 {
    print("-1")
    exit(0)
}

var result: [String] = ["0"]

dfs([])
result.sort { Int($0)! < Int($1)! }

print(result[n])
