//
//  7569.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/21.
//

import Foundation

//가로 세로 높이
typealias Point = (x: Int, y: Int, z: Int, time: Int)

let dx = [0, 0, -1, 1, 0, 0]
let dy = [0, 0, 0, 0, -1, 1]
let dz = [-1, 1, 0, 0, 0, 0]

let mnh = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (m, n, h) = (mnh[0], mnh[1], mnh[2])
var map: [[[Int]]] = Array(repeating: [], count: h)
var tomatoes: [Point] = []
var total = 0
for i in 0..<h {
    for j in 0..<n {
        map[i].append(readLine()!.split { $0 == " " }.map { Int(String($0))! })
        
        for k in 0..<map[i][j].count {
            if map[i][j][k] != -1 {
                total += 1
            }
            
            if map[i][j][k] == 1 {
                tomatoes.append((j, k, i, 0))
            }
        }
    }
}

var ripe = tomatoes.count
var index = 0
while index < tomatoes.count {
    let tomato = tomatoes[index]
    index += 1
    
    for i in 0..<6 {
        let nx = tomato.x + dx[i]
        let ny = tomato.y + dy[i]
        let nz = tomato.z + dz[i]
        let nt = tomato.time + 1
        
        guard 0..<n ~= nx, 0..<m ~= ny, 0..<h ~= nz,
              map[nz][nx][ny] == 0 else { continue }
        map[nz][nx][ny] = 1
        ripe += 1
        
        tomatoes.append((nx, ny, nz, nt))
    }
}

if ripe == total {
    print(tomatoes[index-1].time)
} else {
    print(-1)
}
