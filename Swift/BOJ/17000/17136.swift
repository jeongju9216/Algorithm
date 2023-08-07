//
//  17136.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

func papering(_ x: Int, _ y: Int, _ size: Int, _ isPut: Bool) {
    for i in x..<x+papers[size] {
        for j in y..<y+papers[size] {
            map[i][j] = isPut ? 0 : 1
        }
    }
}

func canPapering(_ x: Int, _ y: Int, _ size: Int) -> Bool {
    let size = papers[size]
    guard x + size <= 10, y + size <= 10 else {
        return false
    }
    
    for i in x..<x+size {
        for j in y..<y+size {
            guard map[i][j] == 1 else {
                return false
            }
        }
    }
    
    return true
}

func backtracking(_ x: Int, _ y: Int, _ count: Int) {
    guard count < result else {
        return
    }
    
    if x > 9 {
        result = min(result, count)
        return
    }
    
    if y > 9 {
        //다음 행으로 이동
        backtracking(x + 1, 0, count)
        return
    }
    
    //1이 붙어 있으면
    if map[x][y] == 1 {
        //색종이 하나씩 붙여보기
        for i in (0..<5).reversed() {
            guard visited[i] > 0, canPapering(x, y, i) else {
                continue
            }
            
            papering(x, y, i, true)
            visited[i] -= 1
            
            backtracking(x, y + 1, count + 1)
            
            visited[i] += 1
            papering(x, y, i, false)
        }
    } else {
        //1이 안 붙어 있으면 바로 다음 칸으로 이동
        backtracking(x, y + 1, count)
    }
}

var map: [[Int]] = []
for _ in 0..<10 {
    map.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

var papers: [Int] = [1, 2, 3, 4, 5]
var visited: [Int] = Array(repeating: 5, count: 5)
var result = Int.max

backtracking(0, 0, 0)

if result == Int.max {
    print("-1")
} else {
    print(result)
}

