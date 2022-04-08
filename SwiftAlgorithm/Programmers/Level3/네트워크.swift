//
//  네트워크.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/08.
//

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    //그래프 만들기
    var graph: [Int: [Int]] = [:]
    var computerCount = 0
    for computer in computers {
        graph.updateValue([], forKey: computerCount)
        
        for i in 0..<computer.count {
            if i != computerCount && computer[i] == 1 {
                graph[computerCount]?.append(i)
            }
        }
        
        computerCount+=1
    }
    
    //dfs
    var stack: [Int] = []
    var visited: [Bool] = Array(repeating: false, count: computerCount)
    var result = 0
    for i in 0..<computerCount {
        if !visited[i] {
            result += 1 //네트워크 카운트
            stack.append(i)
            
            while !stack.isEmpty {
                let top = stack.popLast()!
                visited[top] = true
                
                for node in graph[top]! {
                    if !visited[node] {
                        stack.append(node)
                    }
                }
            }
        }
    }
    
    return result
}
