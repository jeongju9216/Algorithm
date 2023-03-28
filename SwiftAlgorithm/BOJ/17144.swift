//
//  17144.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/27.
//

import Foundation

let rct = readLine()!.components(separatedBy: " ").map { Int($0)! }
let r = rct[0]
let c = rct[1]
let t = rct[2]

var map = Array(repeating: Array(repeating: 0, count: c), count: r)
var tmpMap = map
var ap: [(Int, Int)] = []
for i in 0..<r {
    let line = readLine()!.components(separatedBy: " ").map{Int($0)!}
    for k in 0..<c {
        map[i][k] = line[k]
        if line[k] == -1 {
            ap.append((i,k))
        }
    }
}

func spread(x: Int, y: Int) {
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    let dust = map[x][y] / 5
    
    for i in 0..<4 {
        let nx = x+dx[i]
        let ny = y+dy[i]
        
        guard (0..<r) ~= nx, (0..<c) ~= ny, map[nx][ny] != -1 else {
            continue
        }
        
        tmpMap[nx][ny] += dust
        map[x][y] -= dust
    }

    tmpMap[x][y] += map[x][y]
}

func cleanAntiClock() {
    let x = ap[0].0
    let y = ap[0].1
    
    for nx in stride(from: x-1, through: 1, by: -1) {
        map[nx][y] = map[nx-1][y]
    }
    
    for ny in stride(from: 0, through: c-2, by: +1) {
        map[0][ny] = map[0][ny+1]
    }
    
    for nx in stride(from: 0, through: x-1, by: +1) {
        map[nx][c-1] = map[nx+1][c-1]
    }
    
    for ny in stride(from: c-1, through: 2, by: -1) {
        map[x][ny] = map[x][ny-1]
    }
    
    map[x][y+1] = 0
}

func cleanClock() {
    let x = ap[1].0
    let y = ap[1].1
    
    for nx in stride(from: x+1, through: r-2, by: +1) {
        map[nx][y] = map[nx+1][y]
    }
    
    for ny in stride(from: 0, through: c-2, by: +1) {
        map[r-1][ny] = map[r-1][ny+1]
    }
    
    for nx in stride(from: r-1, through: x+1, by: -1) {
        map[nx][c-1] = map[nx-1][c-1]
    }
    
    for ny in stride(from: c-1, through: 2, by: -1) {
        map[x][ny] = map[x][ny-1]
    }
    
    map[x][y+1] = 0
}

for _ in 0..<t {
    tmpMap = Array(repeating: Array(repeating: 0, count: c), count: r)
    
    for i in 0..<r {
        for k in 0..<c {
            if map[i][k] > 0 {
                spread(x: i, y: k)
            }
        }
    }
    
    tmpMap[ap[0].0][ap[0].1] = -1
    tmpMap[ap[1].0][ap[1].1] = -1
    map = tmpMap
    
    cleanAntiClock()
    cleanClock()
}

let result = map.flatMap { $0 }.filter { $0 > 0 }.reduce(0, +)
print(result)
