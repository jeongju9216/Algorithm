//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/17.
//

//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2022/04/17.
//

import Foundation

let dx: [Int] = [-1, 1, 0, 0]
let dy: [Int] = [0, 0, -1, 1]

func isKeepDistance(x1: Int, y1: Int, x2: Int, y2: Int, place: [[String]]) -> Bool {
    if abs(x1 - x2) + abs(y1 - y2) > 2 {
        return true
    } else {
        if x1 == x2 { //가로 사이에 파티션이 있어야 함
            return place[x1][(y1+y2)/2] == "X"
        } else if y1 == y2 { //세로 사이에 파티션이 있어야 함
            return place[(x1+x2)/2][y1] == "X"
        } else { //양쪽 다 있어야 함
            return place[x1][(y1+y2)/2] == "X" && place[(x1+x2)/2][y1] == "X"
        }
    }
}

func solution(_ places:[[String]]) -> [Int] {
    var results: [Int] = []
    
    for time in 0..<5 { //강의실 5개
        var cpPlaces: [[String]] = []
        var people: [(x: Int, y: Int)] = []
        for i in 0..<5 { //강의실 1개 구하기
            cpPlaces.append([])
            cpPlaces[i] = places[time][i].map { String($0) }
            
            for j in 0..<5 { //강의실의 사람들 좌표 구하기
                if cpPlaces[i][j] == "P" {
                    people.append((i, j))
                }
            }
        }
        
        //사람이 없으면 거리두기 OK
        if people.isEmpty {
            results.append(1)
            continue
        }
        
        var result: Bool = true
        //dfs로 탐색. 모든 사람을 각각 기준 삼아 거리 구하기
        for pCount in 0..<people.count {
            if !result { //거리두기를 안 했으면 더이상 탐색 X
                break
            }
            
            var stack: [(x: Int, y: Int)] = [people[pCount]]
            var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: 5), count: 5)
            while !stack.isEmpty && result {
                let top = stack.popLast()!
                visited[top.x][top.y] = true

                for i in 0..<4 {
                    let nx = top.x + dx[i]
                    let ny = top.y + dy[i]

                    if 0..<5 ~= nx && 0..<5 ~= ny { //범위 체크
                        if !visited[nx][ny] {
                            if cpPlaces[nx][ny] == "O" {
                                stack.append((nx, ny))
                            } else if cpPlaces[nx][ny] == "P" {
                                result = isKeepDistance(x1: people[pCount].x, y1: people[pCount].y, x2: nx, y2: ny, place: cpPlaces)
                            }
                        }
                    }
                }
            }
        }
        
        results.append(result ? 1 : 0)
    }
    
    return results
}

