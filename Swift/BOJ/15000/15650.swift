//
//  15650.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/02.
//

import Foundation

func dfs(_ current: Set<Int>) {
    if current.count == m {
        for num in current.sorted() {
            print(num, terminator: " ")
        }
        print("")
        
        return
    }
    
    var current = current
    for i in (current.max() ?? 1)...n {
        if !current.contains(i) {
            current.insert(i)
            dfs(current)
            current.remove(i)
        }
    }
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

dfs([])
