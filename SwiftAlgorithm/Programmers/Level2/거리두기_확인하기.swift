//
//  거리두기 확인하기.swift
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

let person = "P"
let partition = "X"
let size = 5

func checkPartition(a: (Int, Int), b: (Int, Int)) -> Bool {
    if a.0 == b.0 { //같은 행이라면 세로 사이에 파티션이 있어야 한다.
        return (classroom[a.0][(a.1+b.1)/2] == partition)
    } else if a.1 == b.1 { //같은 열이라면 가로 사이에 파티션이 있어야 한다.
        return (classroom[(a.0+b.0)/2][a.1] == partition)
    } else { //대각선이라면 위아래로 파티션이 모두 있어야 한다.
        return classroom[a.0][(a.1+b.1)/2] == partition && classroom[(a.0+b.0)/2][a.1] == partition
    }
}

func checkDistance(start: (Int, Int)) -> Bool {
    let dx: [Int] = [-1, 1, 0, 0]
    let dy: [Int] = [0, 0, -1, 1]

    var queue: [(Int, Int)] = [start]
    var index = 0
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: size), count: size)
    visited[start.0][start.1] = true
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = node.0 + dx[i]
            let ny = node.1 + dy[i]
            
            guard (0..<size) ~= nx, (0..<size) ~= ny, !visited[nx][ny] else {
                continue
            }
            
            let distance = abs(nx - start.0) + abs(ny - start.1)
            
            visited[nx][ny] = true
            if classroom[nx][ny] == person {
                if distance <= 1 {
                    return false
                } else if distance == 2 && !checkPartition(a: start, b: (nx, ny)) {
                    //파티션이 없으면 false
                    //맨해튼 거리가 2 이하일 때 파티션을 체크한다.
                    return false
                }
            } else if classroom[nx][ny] == "O" && distance < 2 {
                queue.append((nx, ny))
            }
        }
    }
    
    return true
}

var classroom: [[String]] = []
func solution(_ places:[[String]]) -> [Int] {
    var result: [Int] = []

    for place in places {
        //강의실 하나를 의미하는 2차원 배열을 만든다
        classroom = place.map { Array($0).map { String($0) } }
        var resultInt = 1
        
        for i in 0..<size where resultInt == 1 {
            for j in 0..<size {
                //하나하나 탐색하면서 응시자를 만나면 다른 응시자와 맨해튼 거리를 측정한다.
                if classroom[i][j] == person {
                    //bfs를 이용해 거리 체크
                    if !checkDistance(start: (i, j)) {
                        resultInt = 0
                        break
                    }
                }
            }
        }
        
        result.append(resultInt)
    }
    
    return result
}
