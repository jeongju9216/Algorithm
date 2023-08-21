//
//  17070.swift
//  Algorithm
//
//  Created by 유정주 on 2023/08/20.
//

import Foundation

import Foundation

typealias Point = (horizontal: Int, vertical: Int, diagonal: Int)

let n = Int(readLine()!)!
var map: [[Int]] = []
for _ in 0..<n {
    map.append(readLine()!.split { $0 == " " }.map { Int(String($0))! })
}

//가로 세로 대각선
var dp: [[Point]] = Array(repeating: Array(repeating: (0, 0, 0), count: n), count: n)
dp[0][1].horizontal = 1

for i in 0..<n {
    for j in 0..<n where map[i][j] == 0 {
        if j > 0 {
            dp[i][j].horizontal += dp[i][j-1].horizontal + dp[i][j-1].diagonal
        }
        
        if i > 0 {
            dp[i][j].vertical += dp[i-1][j].vertical + dp[i-1][j].diagonal
        }
        
        if i > 0 && j > 0 && map[i-1][j] == 0 && map[i][j-1] == 0 {
            dp[i][j].diagonal += dp[i-1][j-1].horizontal + dp[i-1][j-1].vertical + dp[i-1][j-1].diagonal
        }
    }
}

print(dp[n-1][n-1].horizontal +
      dp[n-1][n-1].vertical +
      dp[n-1][n-1].diagonal)


////dir 0: 가로, 1: 세로, 2: 대각선
//typealias Point = (x: Int, y: Int, dir: Int)
//
////가로 세로 대각선
//let blankDx: [Int: [[Int]]] = [
//    0: [[0], [], [0, 1, 1]],
//    1: [[],  [1], [0, 1, 1]],
//    2: [[0], [1], [0, 1, 1]]
//]
//
//let blankDy: [Int: [[Int]]] = [
//    0: [[1], [], [1, 1, 0]],
//    1: [[],  [0], [1, 1, 0]],
//    2: [[1], [0], [1, 1, 0]]
//]
//
//func dfs(_ node: Point) {
//    if node.x == n-1 && node.y == n-1 {
//        result += 1
//        return
//    }
//
//    let dx = blankDx[node.dir]!
//    let dy = blankDy[node.dir]!
//    for dir in 0..<dx.count {
//        for j in 0..<dx[dir].count {
//            let nx = node.x + dx[dir][j]
//            let ny = node.y + dy[dir][j]
//
//            guard 0..<n ~= nx, 0..<n ~= ny, map[nx][ny] == 0 else {
//                break
//            }
//
//            if j == dx[dir].count - 1 {
//                if j == 0 {
//                    dfs((nx, ny, dir))
//                } else {
//                    //대각선
//                    dfs((node.x + dx[dir][1], node.y + dx[dir][1], dir))
//                }
//            }
//        }
//    }
//}
//
//let n = Int(readLine()!)!
//var map: [[Int]] = []
//for _ in 0..<n {
//    map.append(readLine()!.split { $0 == " " }.map { Int(String($0))! })
//}
//
//
//var start: Point = (0, 1, 0)
//var result = 0
//
//if map[n-1][n-1] != 1 {
//    dfs((0, 1, 0))
//}
//
//print(result)
