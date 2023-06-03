//
//  퍼즐 조각 채우기.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/04/13.
//

import Foundation

//0을 그룹화한다
//처음 만나는 좌표를 기준으로 BFS를 돌려서 블록 좌표를 구한다.
//테이블을 돌린다
//또 블록을 구한다.
//보드도 BFS를 돌려서 빈칸 좌표를 구한다
//똑같은 블록 좌표가 있는지 확인한다.

typealias Node = (x: Int, y: Int, dx: Int, dy: Int)
typealias Block = (dx: Int, dy: Int)

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

var size = 0

func checkSameBlock(_ blocks1: [Block], _ blocks2: [Block]) -> Bool {
    guard blocks1.count == blocks2.count else {
        return false
    }
    
    for i in 0..<blocks1.count {
        if blocks1[i] != blocks2[i] {
            return false
        }
    }
    
    return true
}

func spinTable(_ table: [[Int]]) -> [[Int]] {
    var spin: [[Int]] = table
    for i in 0..<size {
        spin[i] = table.reversed().map { $0[i] }
    }
        
    return spin
}

func bfsBlock(_ i: Int, _ j: Int, _ number: Int, _ map: [[Int]], _ visited: inout [[Bool]]) -> [Block] {
    var blocks: [Block] = []
    
    var queue: [Node] = [(i, j, 0, 0)]
    var index = 0
    visited[i][j] = true
    
    while index < queue.count {
        let (x, y, _, _) = queue[index]
        index += 1

        for k in 0..<4 {
            let nx = x + dx[k]
            let ny = y + dy[k]

            guard (0..<size) ~= nx, (0..<size) ~= ny, !visited[nx][ny] else {
                continue
            }

            visited[nx][ny] = true
            if map[nx][ny] == number {
                queue.append((nx, ny, nx - i, ny - j))
            }
        }
    }
    
    blocks = queue.map { ($0.dx, $0.dy) }
    
    return blocks
}

func groupingTableBlocks(_ i: Int, _ j: Int, _ id: Int, _ map: inout [[Int]], _ visited: inout [[Bool]]) {
    var queue: [Node] = [(i, j, 0, 0)]
    var index = 0
    visited[i][j] = true
    map[i][j] = id
    
    while index < queue.count {
        let (x, y, _, _) = queue[index]
        index += 1

        for k in 0..<4 {
            let nx = x + dx[k]
            let ny = y + dy[k]

            guard (0..<size) ~= nx, (0..<size) ~= ny, !visited[nx][ny] else {
                continue
            }

            visited[nx][ny] = true
            if map[nx][ny] == 1 {
                map[nx][ny] = id
                queue.append((nx, ny, nx - i, ny - j))
            }
        }
    }
}

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    size = table.count
    var table = table
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: size), count: size)
    
    var groupId = 1
    for i in 0..<size {
        for j in 0..<size {
            if table[i][j] == 1 && !visited[i][j] {
                groupingTableBlocks(i, j, groupId, &table, &visited)
                groupId += 1
            }
        }
    }
    
    visited = Array(repeating: Array(repeating: false, count: size), count: size)
    var boardBlocks: [[Block]] = []
    for i in 0..<size {
        for j in 0..<size {
            if game_board[i][j] == 0 && !visited[i][j] {
                boardBlocks.append(bfsBlock(i, j, 0, game_board, &visited))
            }
        }
    }
    
    var tableBlocks: [[[Block]]] = []
    for time in 0..<4 {
        visited = Array(repeating: Array(repeating: false, count: size), count: size)
        var blocks: [[Block]] = Array(repeating: [], count: groupId-1)
        for i in 0..<size {
            for j in 0..<size {
                if table[i][j] > 0 && !visited[i][j] {
                    let id = table[i][j]
                    blocks[id-1] = bfsBlock(i, j, id, table, &visited)
                }
            }
        }
        
        tableBlocks.append(blocks)
        table = spinTable(table)
    }
    
    //넣은 블럭 id -> 블럭은 한 번만 넣을 수 있다.
    var inputId: Set<Int> = []
    var result = 0
    for bb in boardBlocks {
        var isInput = false
        for time in 0..<4 where !isInput {
            for id in 0..<groupId-1 {
                if inputId.contains(id) {
                    continue
                }

                if checkSameBlock(bb, tableBlocks[time][id]) {
                    inputId.insert(id)
                    result += bb.count
                    isInput = true
                    break
                }
            }
        }
    }
    
    return result
}
