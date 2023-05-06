//
//  16235.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/06.
//

import Foundation

typealias Tree = (x: Int, y: Int, count: Int)

let dx = [-1, -1, -1, 0, 0, 1, 1, 1]
let dy = [-1, 0, 1, -1, 1, -1, 0, 1]

let nmk = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nmk[0], m = nmk[1], k = nmk[2]

var map: [[Int]] = Array(repeating: Array(repeating: 5, count: n), count: n)
var A: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    A.append(input)
}

//나무 나이: 개수
var treeMap: [[[Int: Int]]] = Array(repeating: Array(repeating: [:], count: n), count: n)
for _ in 0..<m {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    treeMap[input[0]-1][input[1]-1][input[2], default: 0] += 1
}

for time in 0..<k {
    var deadTrees: [Tree] = []
    var breedTrees: [Tree] = []
    
    //봄
    for i in 0..<n {
        for j in 0..<n where !treeMap[i][j].isEmpty {
            var agingTrees: [Int: Int] = [:]
            for age in treeMap[i][j].keys.sorted() {
                let count = treeMap[i][j][age]!
                
                if age * count <= map[i][j] {
                    //age 나이의 모든 나무가 양분 섭취 가능
                    map[i][j] -= age * count
                    //1살 나이 먹음
                    agingTrees[age + 1] = count
                    
                    if (age + 1) % 5 == 0 {
                        breedTrees.append((i, j, count))
                    }
                } else if age <= map[i][j] {
                    //일부만 가능
                    let agingCount = map[i][j] / age
                    map[i][j] -= age * agingCount
                    //1살 나이 먹음
                    agingTrees[age + 1] = agingCount
                    
                    if (age + 1) % 5 == 0 {
                        breedTrees.append((i, j, agingCount))
                    }
                    
                    deadTrees.append((i, j, (age / 2) * (count - agingCount)))
                } else {
                    //모두 죽음
                    deadTrees.append((i, j, (age / 2) * count))
                }
            }
            
            treeMap[i][j] = agingTrees
        }
    }
    
    //여름
    for (i, j, count) in deadTrees {
        map[i][j] += count
    }
    
    //가을
    for (i, j, count) in breedTrees {
        for k in 0..<8 {
            let nx = i + dx[k]
            let ny = j + dy[k]
            
            guard (0..<n) ~= nx, (0..<n) ~= ny else {
                continue
            }
            
            treeMap[nx][ny][1, default: 0] += count
        }
    }
    
    //겨울
    for i in 0..<n {
        for j in 0..<n {
            map[i][j] += A[i][j]
        }
    }
}

var result = 0
for i in 0..<n {
    for j in 0..<n {
        result += treeMap[i][j].values.reduce(0, +)
    }
}
print(result)
