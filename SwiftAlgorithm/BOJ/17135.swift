//
//  17135.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/27.
//

import Foundation

let nmd = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nmd[0], m = nmd[1], d = nmd[2]
var map: [[Int]] = []
for _ in 0..<n {
    map.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
}

var archersSet: [[Int]] = []
for i in 0..<m-2 {
    for j in i+1..<m-1 {
        for k in j+1..<m {
            archersSet.append([i, j, k])
        }
    }
}

//좌 상 우
let dx = [0, -1, 0], dy = [-1, 0, 1]
var result = 0
for archers in archersSet {
    var tmpMap = map
    var archerIndex = n
    var killCount = 0
    
    for _ in 0..<n {
        var killIndexes: Set<[Int]> = []
        //가장 가까운 적 죽이기
        for archer in archers {
            var queue: [(Int, Int)] = [(archerIndex, archer)]
            var index = 0
            var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
            while index < queue.count {
                let node = queue[index]
                index += 1
                
                for i in 0..<3 {
                    let nx = node.0 + dx[i]
                    let ny = node.1 + dy[i]
                    let dist = abs(archerIndex - nx) + abs(archer - ny)
                    
                    guard (0..<archerIndex) ~= nx, (0..<m) ~= ny, dist <= d else {
                        continue
                    }
                    
                    if tmpMap[nx][ny] == 1 {
                        killIndexes.insert([nx, ny])
                        queue = []
                        break
                    } else if tmpMap[nx][ny] == 0 && !visited[nx][ny] {
                        queue.append((nx, ny))
                        visited[nx][ny] = true
                    }
                }
            }
        }
        
        for killIndex in killIndexes where tmpMap[killIndex[0]][killIndex[1]] == 1 {
            tmpMap[killIndex[0]][killIndex[1]] = 0
            killCount += 1
        }
        
        archerIndex -= 1
    }
    
    result = max(result, killCount)
}

print(result)
