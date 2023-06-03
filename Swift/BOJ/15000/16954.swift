//
//  16954.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/12.
//

//시간에 따라 맵이 바뀌기 때문에 sec와 map을 노드로 이용한다
//벽을 한 칸씩 내리면서 bfs을 진행한다
//시간에 따라 visited 상태가 바뀌기 때문에 3차원 visited를 이용한다.

import Foundation

typealias Point = (x: Int, y: Int, sec: Int, map: [[String]])

let dx = [-1, -1, 0, 1, 1, 1, 0, -1, 0]
let dy = [0, 1, 1, 1, 0, -1, -1, -1, 0]

func down(_ map: [[String]]) -> [[String]] {
    var tmp = Array(map.dropLast().reversed())
    tmp.append(Array(repeating: ".", count: size))
    return Array(tmp.reversed())
}

func bfs() {
    var queue: [Point] = [(7, 0, 0, map)]
    var index = 0

    var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: size + 1), count: size), count: size)
    visited[7][0][0] = true
    
    while index < queue.count {
        let (x, y, sec, map) = queue[index]
        index += 1
        
        if x == 0 && y == size - 1 {
            result = true
            return
        }
        
        for i in 0..<9 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            //시간은 0~8초까지만 존재 가능(이후에는 벽이 사라짐)
            let nSec = min(sec + 1, 8)
            let nextMap = down(map)
            
            guard range ~= nx, range ~= ny, !visited[nx][ny][nSec] else {
                continue
            }
            
            //현재 위치가 벽이면 이동할 수 없음
            if map[nx][ny] == "#" {
                continue
            }
            
            //다음 위치가 벽인 곳으로 이동할 수 없음
            if nextMap[nx][ny] == "#" {
                continue
            }
            
            visited[nx][ny][nSec] = true
            queue.append((nx, ny, nSec, nextMap))
        }
    }
}

let size = 8
let range = (0..<size)

var map: [[String]] = []
for _ in 0..<size {
    map.append(Array(readLine()!).map { String($0) })
}
var result = false

bfs()

if result {
    print("1")
} else {
    print("0")
}
