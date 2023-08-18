//
//  1194.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/08/18.
//

import Foundation

//키를 가지고 있냐 없냐가 포인트
//키를 가지고 있는지를 node에 둠

struct Node {
    let x: Int
    let y: Int
    let time: Int
    let key: Int
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
let keyDict = ["a": 0, "b": 1, "c": 2, "d": 3, "e": 4, "f": 5]

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var map: [[String]] = []
var queue: [Node] = []
var index = 0
var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: 1 << 6), count: m), count: n)
for i in 0..<n {
    map.append(Array(readLine()!).map { String($0) })
    for j in 0..<m {
        if map[i][j] == "0" {
            queue.append(Node(x: i, y: j, time: 0, key: 0))
            visited[i][j][0] = true
            map[i][j] = "."
        }
    }
}

var result = Int.max
while index < queue.count {
    let node = queue[index]
    index += 1
        
    if map[node.x][node.y] == "1" {
        result = min(result, node.time)
        break
    }
    
    let key = node.key
    for i in 0..<4 {
        let nx = node.x + dx[i]
        let ny = node.y + dy[i]
        let nt = node.time + 1
                
        guard 0..<n ~= nx, 0..<m ~= ny,
              map[nx][ny] != "#", !visited[nx][ny][key] else { continue }
        
        if map[nx][ny] == "." || map[nx][ny] == "1" {
            //빈 칸, 출구
            visited[nx][ny][key] = true
            queue.append(Node(x: nx, y: ny, time: nt, key: key))
        } else {
            if "a"..."f" ~= map[nx][ny] {
                //열쇠
                let bitmask = 1 << keyDict[map[nx][ny]]!
                let nk = key | bitmask
                visited[nx][ny][key] = true
                visited[nx][ny][nk] = true
                queue.append(Node(x: nx, y: ny, time: nt, key: nk))
            } else {
                //문
                let bitmask = 1 << keyDict[map[nx][ny].lowercased()]!
                if (key & bitmask) != 0 {
                    visited[nx][ny][key] = true
                    queue.append(Node(x: nx, y: ny, time: nt, key: key))
                }
            }
        }
    }
}

print(result == Int.max ? -1 : result)
