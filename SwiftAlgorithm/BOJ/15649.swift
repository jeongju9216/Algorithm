//
//  15649.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/02.
//

import Foundation

func dfs(_ current: [Int]) {
    guard current.count < m else {
        for num in current {
            print(num, terminator: " ")
        }
        print("")
        return
    }
    
    for i in 1...n {
        if !current.contains(i) {
            dfs(current + [i])
        }
    }
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

dfs([])
