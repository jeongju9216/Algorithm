//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/09.
//

//1260 DFS와 BFS
import Foundation

var dotCount = 0, lineCount = 0, startNum = 0
var graph: [Int:[Int]] = [:]
var visitedNode: [Int] = []
var needVisitNode: [Int] = []

func inputData() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    dotCount = input[0]
    lineCount = input[1]
    startNum = input[2]
}

func createGraph() {
    for i in 1...dotCount {
        graph.updateValue([], forKey: i)
    }
    
    for _ in 0..<lineCount {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        graph[input[0]]?.append(input[1])
        graph[input[1]]?.append(input[0])
    }
}

func solution() {
    //1
//    for i in 1...dotCount {
//        graph[i]?.sort(by: >)
//    }
//    dfs()
    //2
    for i in 1...dotCount {
        graph[i]?.sort(by: <)
    }
    dfs2(node: startNum)
    print("")
    
    visitedNode = []
    needVisitNode = []
    
    for i in 1...dotCount {
        graph[i]?.sort(by: <)
    }
    bfs()
}

//반복문
func dfs() {
    needVisitNode.append(startNum)
    while !needVisitNode.isEmpty {
        let node = needVisitNode.removeLast()
        if visitedNode.contains(node) {
            continue
        }
        
        visitedNode.append(node)
        needVisitNode += graph[node] ?? []
    }
    
    print(visitedNode.map { String($0) }.joined(separator: " "))
}

//재귀
func dfs2(node: Int) {
    if visitedNode.contains(node) {
        return
    }
    visitedNode.append(node)
    print(node, terminator: " ")
    
    for i in graph[node]! {
        dfs2(node: i)
    }
}

func bfs() {
    needVisitNode.append(startNum)
    while !needVisitNode.isEmpty {
        let node = needVisitNode.removeFirst()
        if visitedNode.contains(node) {
            continue
        }
     
        visitedNode.append(node)
        needVisitNode += graph[node] ?? []
    }
    
    print(visitedNode.map { String($0) }.joined(separator: " "))
}

inputData()
createGraph()
solution()
