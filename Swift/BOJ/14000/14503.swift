//
//  14503.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/06.
//

import Foundation

//빈 칸이 없는 경우 한 칸 후진 -> direction을 가지고 있어야 함
//현재 방향 기준으로 반시계 방향으로 회전 -> 현재 direction에 + 4 씩 하면서 % 4 연산 값
//visited가 true이면 청소가 된 곳

//북동남서
//북 -> 서 -> 남 -> 동 -> 북
let dx = [-1, 0, 1, 0], dy = [0, 1, 0, -1]

struct Item {
    var x: Int
    var y: Int
    var direction: Int
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

let startInput = readLine()!.components(separatedBy: " ").map { Int($0)! }
var robot = Item(x: startInput[0], y: startInput[1], direction: startInput[2])

var map: [[Bool]] = []
for _ in 0..<n {
    map.append(readLine()!.components(separatedBy: " ").map { $0 == "0" })
}

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
visited[robot.x][robot.y] = true

var count = 1
while true {
    var canClean = false
    for i in (0..<4).reversed() {
        let d = (robot.direction + i) % 4
        let nx = robot.x + dx[d]
        let ny = robot.y + dy[d]
        
        if map[nx][ny] && !visited[nx][ny] {
            visited[nx][ny] = true
            canClean = true
            robot = Item(x: nx, y: ny, direction: d)
            break
        }
    }
    
    if canClean {
        count += 1
    } else {
        //후진
        let nx = robot.x - dx[robot.direction]
        let ny = robot.y - dy[robot.direction]
        
        guard map[nx][ny] else {
            break
        }

        robot.x = nx
        robot.y = ny
    }
}

print(count)
