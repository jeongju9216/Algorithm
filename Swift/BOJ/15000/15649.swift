//
//  15649.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/02.
//

import Foundation

func dfs(_ current: [Int]) {
    if current.count == m {
        print(current.map { "\($0)" }.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if current.contains(i) {
            continue
        }
        
        dfs(current + [i])
    }
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

dfs([])
