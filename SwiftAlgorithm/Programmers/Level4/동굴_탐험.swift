//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/16.
//

import Foundation

func solution(_ n:Int, _ path:[[Int]], _ order:[[Int]]) -> Bool {
    var graph: [Int: [Int]] = [:]
    for i in 0..<n {
        graph[i] = []
    }
    
    path.forEach {
        graph[$0[0]]?.append($0[1])
        graph[$0[1]]?.append($0[0])
    }
    
    var waitingDict: [Int:Int] = [:]
    var closeDict: [Int:Int] = [:]
    order.forEach {
        closeDict[$0[0]] = $0[1]
        waitingDict[$0[1]] = $0[0]
    }
    
    if let _ = waitingDict[0] {
        return false
    }
    
    var needVisited: [Int] = [0]
    var waiting: [Bool] = Array(repeating: false, count: n)
    var visited: [Bool] = Array(repeating: false, count: n)
    
    while !needVisited.isEmpty {
        let node = needVisited.popLast()!
        visited[node] = true
        
        if let opened = closeDict[node] {
            closeDict[node] = nil
            if waiting[opened] {
                waiting[opened] = false
                needVisited.append(opened)
            } else {
                waitingDict[opened] = nil
            }
        }

        for n in graph[node]! {
            if !visited[n] && !waiting[n] {
                if let _ = waitingDict[n] {
                    waitingDict[n] = nil
                    waiting[n] = true
                } else {
                    needVisited.append(n)
                }
            }
        }
    }
    
    return closeDict.isEmpty
}
