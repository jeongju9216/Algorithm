//
//  8979.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/07.
//

import Foundation

let nk = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nk[0], k = nk[1]

var graph: [(Int, [Int])] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    graph.append((input[0], Array(input[1...])))
}

graph.sort {
    if $0.1[0] != $1.1[0] {
        return $0.1[0] > $1.1[0]
    } else if $0.1[1] != $1.1[1] {
        return $0.1[1] > $1.1[1]
    } else {
        return $0.1[2] > $1.1[2]
    }
}

var result = 1
if graph[0].0 != k {
    for i in 1..<n {
        if graph[i].1 != graph[i-1].1 {
            result = i + 1
        }
        
        if graph[i].0 == k {
            break
        }
    }
}

print(result)
