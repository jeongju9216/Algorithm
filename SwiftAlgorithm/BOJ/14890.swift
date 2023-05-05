//
//  14890.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/05/05.
//

import Foundation

func counting(_ map: [[Int]]) -> Int {
    var countRoad = 0
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
    
    for i in 0..<n {
        var isRoad = true
        var j = 1
        while j < n && isRoad {
            //한 칸 초과로 차이 나는 경우
            if abs(map[i][j-1] - map[i][j]) > 1 {
                isRoad = false
                break
            }
            
            if map[i][j] < map[i][j-1] {
                //현재 위치에 경사로 지어야 함
                let num = map[i][j]
                for _ in 0..<l {
                    if j >= n || map[i][j] != num || visited[i][j] {
                        isRoad = false
                        break
                    }
                    
                    visited[i][j] = true
                    j += 1
                }
                j -= 1
            } else if map[i][j] > map[i][j-1] {
                //이전 위치에 경사로 지어야 함
                let num = map[i][j-1]
                for k in 1...l {
                    if j-k < 0 || map[i][j-k] != num || visited[i][j-k] {
                        isRoad = false
                        break
                    }
                    
                    visited[i][j-k] = true
                }
            }
            
            j += 1
        }
        
        if isRoad {
            countRoad += 1
        }
    }

    return countRoad
}

let nl = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nl[0], l = nl[1]

var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    map.append(input)
}

var result = 0

//가로 체크
result += counting(map)

//세로 체크
let tmpMap = map
for i in 0..<n {
    map[i] = tmpMap.map { $0[i] }
}
result += counting(map)

print(result)
