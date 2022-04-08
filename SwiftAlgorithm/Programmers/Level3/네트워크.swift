//
//  네트워크.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/08.
//

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    //dfs
    var stack: [Int] = []
    var visited: [Bool] = Array(repeating: false, count: n)
    var result = 0
    for i in 0..<n {
        if !visited[i] {
            result += 1 //네트워크 카운트
            stack.append(i)
            
            while !stack.isEmpty {
                let top = stack.popLast()!
                visited[top] = true
                
                for j in 0..<n {
                    if j != top && computers[top][j] == 1 && !visited[j] {
                        stack.append(j)
                    }
                }
            }
        }
    }
    
    return result
}
