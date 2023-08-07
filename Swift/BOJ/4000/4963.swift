//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/03/30.
//

//4963 섬의 개수
import Foundation

var w = 0, h = 0
var maps: [[Int]] = [[Int]]()

let di = [1, 1, 0, -1, -1, -1, 0, 1]
let dj = [0, 1, 1, 1, 0, -1, -1, -1]
func bfs(_ i: Int, _ j: Int) {
    var queue: [(Int, Int)] = [(i, j)]
        
    while !queue.isEmpty {
        let node = queue.removeFirst()
        for i in 0..<8 {
            let (nx, ny) = (node.0 + di[i], node.1 + dj[i])
            if (0..<h).contains(nx) && (0..<w).contains(ny) {
                if maps[nx][ny] == 1 {
                    maps[nx][ny] = 0
                    queue.append((nx, ny))
                }
            }
        }
    }
}

while true {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    w = input[0]
    h = input[1]
    if w == 0 && h == 0 {
        break
    }
    
    maps = [[Int]]()
    
    for _ in 0..<h {
        let map: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
        maps.append(map)
    }
    
    var result: Int = 0
    for i in 0..<h {
        for j in 0..<w {
            if maps[i][j] == 1 {
                result += 1
                bfs(i, j)
            }
        }
    }
    print(result)
}
