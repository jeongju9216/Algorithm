//
//  14503.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/09.
//

import Foundation

import Foundation

func solution() {
    map[robot.r][robot.c] = -1
    result += 1
    
    while true {
        if spin() {
            map[robot.r][robot.c] = -1
            result += 1
        } else {
            let backX = robot.r - dx[robot.d]
            let backY = robot.c - dy[robot.d]
            if map[backX][backY] == 1 {
                return
            } else {
                robot = (backX, backY, robot.d)
            }
        }
    }
}

func spin() -> Bool {
    var nd = robot.d
    for _ in 0..<4 {
        nd -= 1
        if nd < 0 {
            nd += 4
        }
        
        let nx = robot.r + dx[nd]
        let ny = robot.c + dy[nd]
        
        guard 0..<n ~= nx && 0..<m ~= ny && map[nx][ny] == 0 else {
            continue
        }
        
        //회전
        robot = (nx, ny, nd)
        return true
    }
    
    return false
}

//북 동 남 서
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]

let rcd = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var robot: (r: Int, c: Int, d: Int) = (rcd[0], rcd[1], rcd[2])

//0: 청소 안 됨, 1: 벽이 있음
var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    map.append(input)
}

var result = 0
solution()
print(result)
