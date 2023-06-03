//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/08.
//

//1012 유기농 배추
import Foundation

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

func bfs(_ x: Int, _ y: Int) {
    var queue: [(x: Int, y: Int)] = [(x, y)]
    var index = 0
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = node.x + dx[i]
            let ny = node.y + dy[i]
            
            guard (0..<n) ~= nx, (0..<m) ~= ny, !visited[nx][ny] else {
                continue
            }
            
            visited[nx][ny] = true
            if map[nx][ny] == 1 {
                queue.append((nx, ny))
            }
        }
    }
}

var testcase = Int(readLine()!)!
var m = 0, n = 0, k = 0
var map: [[Int]] = []
var visited: [[Bool]] = []
for _ in 0..<testcase {
    let mnk = readLine()!.split { $0 == " " }.map { Int($0)! }
    m = mnk[0]; n = mnk[1]; k = mnk[2]
    map = Array(repeating: Array(repeating: 0, count: m), count: n)
    for _ in 0..<k {
        let xy = readLine()!.split { $0 == " " }.map { Int($0)! }
        map[xy[1]][xy[0]] = 1
    }
    
    visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var result = 0
    for i in 0..<n {
        for j in 0..<m {
            if !visited[i][j] && map[i][j] == 1 {
                result += 1
                bfs(i, j)
            }
        }
    }
    
    print(result)
}
