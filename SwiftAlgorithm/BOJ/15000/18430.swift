//
//  18430.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/10.
//

import Foundation

let dx = [[0, 1], [0, -1], [-1, 0], [0, 1]]
let dy = [[-1, 0], [-1, 0], [0, 1], [1, 0]]

typealias Point = (x: Int, y: Int)

func backtracking(_ i: Int, _ j: Int, _ sum: Int) {
    
    let i = i + j / m
    let j = j % m
    guard (0..<n) ~= i, (0..<m) ~= j else {
        result = max(result, sum)
        return
    }

    //부메랑 만들 수 있는지 체크
    if !visited[i][j] {
        for k in 0..<4 {
            let next1: Point = (i + dx[k][0], j + dy[k][0])
            let next2: Point = (i + dx[k][1], j + dy[k][1])
            
            guard (0..<n) ~= next1.x, (0..<m) ~= next1.y,
                  (0..<n) ~= next2.x, (0..<m) ~= next2.y else {
                continue
            }
            
            //부메랑을 만들 수 있음
            if !visited[next1.x][next1.y] && !visited[next2.x][next2.y] {
                visited[i][j] = true
                visited[next1.x][next1.y] = true
                visited[next2.x][next2.y] = true
                
                let number = map[i][j] * 2 + map[next1.x][next1.y] + map[next2.x][next2.y]
                backtracking(i, j + 1, sum + number)
                
                visited[i][j] = false
                visited[next1.x][next1.y] = false
                visited[next2.x][next2.y] = false
            }
        }
    }
    
    //부메랑을 안 만드는 경우
    backtracking(i, j + 1, sum)
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    map.append(input)
}

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)

var result = 0
backtracking(0, 0, 0)

print(result)
