//
//  17255.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/03.
//

import Foundation

func dfs(_ left: Int, _ right: Int, _ current: String, _ depth: Int) {
    if depth == arr.count {
        result.insert(current)
        return
    }
    
    if left - 1 >= 0 {
        dfs(left - 1, right, current + arr[left-1...right].joined(), depth + 1)
    }
    
    if right + 1 < arr.count {
        dfs(left, right + 1, current + arr[left...right+1].joined(), depth + 1)
    }
}

let n = Int(readLine()!)!
let arr = Array(String(n)).map { String($0) }

var result: Set<String> = []

for i in 0..<arr.count {
    dfs(i, i, arr[i], 1)
}

print(result.count)
