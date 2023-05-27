//
//  21609.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/06.
//

import Foundation

//1~m까지 bfs로 돌면서 그룹을 만든다 -> x, y, count, number 필요함
//그룹 중에서 문제 기준에 맞는 제거할 그룹을 찾는다
//제거하고 점수를 획득한다 (number ** 2)
//중력을 적용한다.
//90도 반시계로 돌린다
//중력을 적용한다
//더이상 그룹이 없을 때까지 반복한다

func printMap(_ title: String) {
//    print("----- \(title) -----")
//    for line in map {
//        for num in line {
//            if num == Int.min {
//                print(String(format: "  -"), terminator: " ")
//            } else {
//                print(String(format: "%3d", num), terminator: " ")
//            }
//        }
//        print("")
//    }
}

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

struct Item: CustomStringConvertible {
    var x: Int
    var y: Int
    var number: Int
    
    var description: String {
        return "(\(number))"
    }
}

func makeGroup(_ start: Item, _ visited: inout [[Bool]]) -> [Item] {
    var queue = [start]
    var index = 0
    visited[start.x][start.y] = true
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = node.x + dx[i]
            let ny = node.y + dy[i]
            
            guard (0..<n) ~= nx, (0..<n) ~= ny, !visited[nx][ny] else {
                continue
            }
            
            let item = map[nx][ny]
            if item == start.number || item == 0 {
                visited[nx][ny] = true
                queue.append(Item(x: nx, y: ny, number: item))
            }
        }
    }
    
    for item in queue {
        if item.number == 0 {
            visited[item.x][item.y] = false
        }
    }
    
    return queue
}

func popBlock(_ group: [[Item]]) {
    //기준, 크기, 무지개 블록 개수, 가장 작은 행, 가장 작은 열
    var compareArray: [[Int]] = []
    for std in 0..<group.count {
        guard group[std].count > 1 else {
            continue
        }
        
        let count = group[std].count
        let rainbowCount = group[std].filter { $0.number == 0 }.count
        let minCol = group[std][0].x
        let minRow = group[std][0].y
        compareArray.append([std, count, rainbowCount, minCol, minRow])
    }
            
    if compareArray.isEmpty {
        return
    }
    
    compareArray.sort {
        if $0[1] != $1[1] {
            return $0[1] > $1[1]
        }
        
        if $0[2] != $1[2] {
            return $0[2] > $1[2]
        }
        
        if $0[3] != $1[3] {
            return $0[3] > $1[3]
        }
        
        if $0[4] != $1[4] {
            return $0[4] > $1[4]
        }
        
        return $0[0] < $1[0]
    }
    
//    print("compareArray: \(compareArray)")
    
    let popGroup = group[compareArray[0][0]]
    result += Int(pow(Double(popGroup.count), 2.0))
    
    for item in popGroup {
        map[item.x][item.y] = Int.min
    }
}

func gravity() {
    for i in 0..<n {
        for j in (0..<n).reversed() {
            guard map[j][i] >= 0 else {
                continue
            }
            
            let num = map[j][i]
            var next = j + 1
            while (0..<n) ~= next, map[next][i] == Int.min {
                next += 1
            }
            
            next -= 1
            map[j][i] = Int.min
            map[next][i] = num
        }
    }
}

func turnAnti90() {
    var tmpMap = map
    for i in 0..<n {
        map[i] = tmpMap.map { $0[n-i-1] }
    }
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    map.append(input)
}

printMap("Original")

var result = 0
while true {
    var group: [[Item]] = []
    
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
    for std in 1...m {
        for i in 0..<n {
            for j in 0..<n {
                if map[i][j] == std && !visited[i][j] {
                    let stdGroup: [Item] = makeGroup(Item(x: i, y: j, number: std), &visited)
                    if stdGroup.count >= 2 {
                        group.append(stdGroup)
                    }
                }
            }
        }
    }
    
    if group.isEmpty {
        break
    }
    
    popBlock(group)
    printMap("After popBlock")

    gravity()
    printMap("After Gravity")
    
    turnAnti90()
    printMap("After turnAnti90")
    
    gravity()
    printMap("After gravity")
}

print(result)
