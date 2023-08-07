//
//  1923.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/07.
//

import Foundation

func prime(_ num: Int) {
    if num < 2 {
        return
    }
    
    for i in 2...num {
        for j in stride(from: i * i, through: num, by: i) where visited[j] {
            visited[j] = false
        }
    }
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var visited = Array(repeating: true, count: m + 1)
visited[1] = false
prime(m)

for i in n...m where visited[i] {
    print(i)
}
