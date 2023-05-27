//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/29.
//

//2667 단지번호붙이기
import Foundation

let count = Int(readLine()!)!
var map: [[Int]] = Array(repeating: [], count: count)
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: count), count: count)

var result: Int = 0
var results: [Int] = []

for i in 0..<count {
    let input = readLine()!.map { Int(String($0))! }
    map[i].append(contentsOf: input)
}

let di: [Int] = [1, -1, 0, 0]
let dj: [Int] = [0, 0, -1, 1]
func dfs(_ i: Int, _ j: Int) {
    if visited[i][j] {
        return
    } else {
        visited[i][j] = true
        result += 1
        
        for k in 0..<4 {
            let i2 = i + di[k]
            let j2 = j + dj[k]
            if i2 >= 0 && i2 < count && j2 >= 0 && j2 < count {
                if map[i2][j2] == 1 {
                    dfs(i2, j2)
                }
            }
        }
    }
}

for i in 0..<count {
    for j in 0..<count {
        if !visited[i][j] && map[i][j] == 1 {
            result = 0
            dfs(i, j)
            results.append(result)
        }
    }
}

results.sort()
print(results.count)
for result in results {
    print(result)
}
