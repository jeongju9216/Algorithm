//
//  17836.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/11.
//

import Foundation

//그람을 줍는 경우 vs 안 줍는 경우
//그람을 안 줍는게 더 빠르면 안 줍는게 나음
//그람을 주워서 더 빨리 갈 수 있다면 줍는게 나음
//그람을 주웠다면 벽에 상관없이 큐에 넣기
typealias Point = (x: Int, y: Int, count: Int, haveGram: Int)
let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

let nmt = readLine()!.split { $0 == " " }.map { Int($0)! }
let n = nmt[0], m = nmt[1], t = nmt[2]
var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    map.append(input)
}

var queue: [Point] = [(0, 0, 0, 0)]
var index = 0
//gram 유무에 따라서도 다름
var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: m), count: n)
visited[0][0][0] = true

var result = Int.max
while index < queue.count {
    let node = queue[index]
    index += 1
    
    if node.x == n-1 && node.y == m-1 {
        result = min(result, node.count)
        continue
    }
    
    for i in 0..<4 {
        let nx = node.x + dx[i]
        let ny = node.y + dy[i]
        
        guard (0..<n) ~= nx, (0..<m) ~= ny else {
            continue
        }
        
        if !visited[nx][ny][node.haveGram] {
            visited[nx][ny][node.haveGram] = true
            
            //그람이 없으면 벽을 못 뿌심
            if node.haveGram == 0 && map[nx][ny] == 1 {
                continue
            }
            
            var haveGram = node.haveGram
            if map[nx][ny] == 2 {
                haveGram = 1
            }
            queue.append((nx, ny, node.count + 1, haveGram))
        }
    }
}

if result > t {
    print("Fail")
} else {
    print(result)
}

