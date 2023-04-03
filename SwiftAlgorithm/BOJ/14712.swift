//
//  14712.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/03.
//

import Foundation

func isFull(_ x: Int, _ y: Int) -> Bool {
    guard (0..<n) ~= x-1 && (0..<m) ~= y-1 else {
        return false
    }
    
    return map[x-1][y] && map[x][y-1] && map[x-1][y-1]
}

func dfs(_ count: Int) {
    if count == n * m {
        result += 1
        return
    }
    
    //다음 좌표 구하기
    let x = count / m
    let y = count % m
    
    //현재 위치에 안 넣는 경우
    dfs(count + 1)
    
    if !isFull(x, y) {
        //현재 위치에 놓아도 2x2를 안 채우는 경우
        map[x][y] = true
        dfs(count + 1)
        map[x][y] = false
    }
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var map: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
var result = 0

dfs(0)

print(result)
