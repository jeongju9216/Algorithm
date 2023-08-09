//
//  15650.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/02.
//

import Foundation

func dfs(_ current: [Int], _ num: Int) {
    if current.count == m {
        print(current.map { "\($0)" }.joined(separator: " "))
        return
    }
    
    for i in num...n {
        if current.contains(i) {
            continue
        }
        
        dfs(current + [i], i)
    }
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

dfs([], 1)
