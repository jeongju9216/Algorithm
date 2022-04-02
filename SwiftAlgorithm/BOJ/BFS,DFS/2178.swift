//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/02.
//

//2178 미로 탐색
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let h = input[0], w = input[1]
var result = 0

var graph: [[Int]] = []
for _ in 0..<h {
    let input = readLine()!.map { Int(String($0))! }
    graph.append(input)
}

var queue: [(x: Int, y: Int, count: Int)] = [(0,0,1)]
var index = 0

let dx: [Int] = [1, -1, 0, 0]
let dy: [Int] = [0, 0, -1, 1]
while index < queue.count {
    let node = queue[index]
    index += 1
    
    for i in 0..<4 {
        let nx = node.x + dx[i]
        let ny = node.y + dy[i]
        let nCount = node.count + 1
        
        if nx >= 0 && nx < h && ny >= 0 && ny < w {
            if graph[nx][ny] == 1 {
                result = nCount
                if nx == h-1 && ny == w-1 {
                    index = queue.count
                    break
                }
                
                graph[nx][ny] = 0
                queue.append((nx, ny, nCount))
            }
        }
    }
}

print(result)
