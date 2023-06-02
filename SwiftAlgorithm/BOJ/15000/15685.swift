//
//  15685.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/07.
//

import Foundation

//오 위 왼 아
let dx = [0, -1, 0, 1]
let dy = [1, 0, -1, 0]

let n = Int(readLine()!)!
var items: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    items.append(input)
}

var map: [[Bool]] = Array(repeating: Array(repeating: false, count: 101), count: 101)
for item in items {
    //x: 세로, y: 가로
    let x = item[1], y = item[0]
    let d = item[2], g = item[3]
    
    map[x][y] = true
    
    //0세대
    var nx = x + dx[d]
    var ny = y + dy[d]
    map[nx][ny] = true
    
    if g == 0 {
        continue
    }
    
    var stack = [d]
    //커브 만들기
    for _ in 1...g {
        let size = stack.count
        
        //스택에 담은걸 빼서 다시 담고
        //역순으로 빼서 벡터 배열 적용
        for j in (0..<size).reversed() {
            let nd = (stack[j] + 1) % 4
            nx += dx[nd]
            ny += dy[nd]
            
            map[nx][ny] = true
            stack.append(nd)
        }
    }
}

var result = 0
for i in 0...100-1 {
    for j in 0...100-1 {
        if map[i][j] && map[i+1][j] && map[i][j+1] && map[i+1][j+1] {
            result += 1
        }
    }
}

print(result)
