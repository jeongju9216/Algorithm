//
//  20057.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/09.
//

import Foundation

//동서남북
let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]

//1 1 7 7 10 10 2 2 5 비율 매핑
//토네이도 중심 기준으로 비율이 들어있는 좌표
let xdx = [
    [-1, 1, -1, 1, -1, 1, -2, 2, 0, 0],
    [-1, 1, -1, 1, -1, 1, -2, 2, 0, 0],
    [0, 0, 1, 1, 2, 2, 1, 1, 3, 2],
    [0, 0, -1, -1, -2, -2, -1, -1, -3, -2]
]

let ydy = [
    [0, 0, 1, 1, 2, 2, 1, 1, 3, 2],
    [0, 0, -1, -1, -2, -2, -1, -1, -3, -2],
    [-1, 1, -1, 1, -1, 1, -2, 2, 0, 0],
    [-1, 1, -1, 1, -1, 1, -2, 2, 0, 0]
]

let percent = [1, 1, 7, 7, 10, 10, 2, 2, 5]

func changeDirection(_ current: Int) -> Int {
    switch current {
    case 0: return 3
    case 1: return 2
    case 2: return 0
    case 3: return 1
    default: return -1
    }
}

func spreadSand(_ x: Int, _ y: Int, _ d: Int) {
    let xx = x + dx[d]
    let yy = y + dy[d]
    if map[xx][yy] == 0 {
        return
    }
    
    var sand = map[xx][yy]
    let tmp = sand
    //비율 좌표 9개 확인
    for i in 0..<9 {
        let nx = x + xdx[d][i]
        let ny = y + ydy[d][i]
        let per = percent[i]
        let plus = (tmp * per) / 100
        
        
        if (1...n) ~= nx, (1...n) ~= ny {
            //범위 안이면 모래 합치기
            map[nx][ny] += plus
        } else {
            //범위를 벗어나면 결과에 더함
            result += plus
        }
        
        sand -= plus
    }
    
    //a 위치 계산 -> 모든 모래 이동
    let nx = x + xdx[d][9]
    let ny = y + ydy[d][9]
    if (1...n) ~= nx, (1...n) ~= ny {
        map[nx][ny] += sand
    } else {
        result += sand
    }
    map[xx][yy] = 0
}

let n = Int(readLine()!)!
var map: [[Int]] = [[]]
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    map.append([0] + input)
}

var result = 0

var x = (n + 1) / 2
var y = (n + 1) / 2
var dir = 1 //서풍으로 시작
var moveCount = 1

while moveCount <= n {
    //moveCount는 2번마다 증가함
    for _ in 0..<2 {
        for _ in 0..<moveCount {
            spreadSand(x, y, dir)
            x += dx[dir]
            y += dy[dir]
        }
        
        dir = changeDirection(dir)
    }
    
    moveCount += 1
    //최상단 마지막 움직임일 때
    if moveCount == n {
        for _ in 0..<moveCount {
            spreadSand(x, y, dir)
            x += dx[dir]
            y += dy[dir]
        }
        break
    }
}

print(result)
