//
//  15683.swift
//  Algorithm
//
//  Created by 유정주 on 2023/06/17.
//

import Foundation

//모든 CCTV를 저장해두고,
//백트래킹으로 하나씩 회전시키면서 확인함
//dfs로 확인

typealias Point = (x: Int, y: Int)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
let directions = [
    [],
    [[0], [1], [2], [3]], // 1번 CCTV
    [[0, 1], [2, 3]], // 2번 CCTV
    [[0, 2], [0, 3], [1, 2], [1, 3]], // 3번 CCTV
    [[0, 1, 2], [0, 1, 3], [0, 2, 3], [1, 2, 3]], // 4번 CCTV
    [[0, 1, 2, 3]] // 5번 CCTV
]

func countArea(_ map: [[Int]]) -> Int {
    var count = 0
    for i in 0..<n {
        count += map[i].filter { $0 == 0 }.count
    }
    
    return count
}

func fillArea(_ map: inout [[Int]], _ cctv: Point, _ dir: [Int]) -> [Point] {
    // 6이 나올 때까지 채우기
    var changes: [Point] = []
    
    for d in dir {
        var nx = cctv.x
        var ny = cctv.y
        
        while 0..<n ~= nx && 0..<m ~= ny && map[nx][ny] != 6 {
            if map[nx][ny] == 0 {
                map[nx][ny] = -1
                changes.append((nx, ny))
            }
            
            nx += dx[d]
            ny += dy[d]
        }
    }
    
    return changes
}

func dfs(_ depth: Int, _ map: [[Int]]) {
    if depth == cctves.count {
        let newCount = countArea(map)
//        print("result: \(result) / newCount: \(newCount)")
//
//        for line in map {
//            line.forEach { print($0, terminator: " ") }
//            print("")
//        }
        
        result = min(result, newCount)
        return
    }
    
    var map = map
    
    let cctv = cctves[depth]
    let number = map[cctv.x][cctv.y]
    
    for dir in directions[number] {
        let changes = fillArea(&map, cctv, dir)
        dfs(depth + 1, map)
        
        for point in changes {
            map[point.x][point.y] = 0
        }
    }
}

//입력
let nm = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nm[0], m = nm[1]

var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    map.append(input)
}

//CCTV 찾기
var cctves: [Point] = []
for i in 0..<n {
    for j in 0..<m {
        if map[i][j] != 0 && map[i][j] != 6 {
            cctves.append((i, j))
        }
    }
}

var result = Int.max

dfs(0, map)

print(result)
