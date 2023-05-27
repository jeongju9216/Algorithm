//
//  13460.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/23.
//

import Foundation

struct Item {
    var redX: Int
    var redY: Int
    var blueX: Int
    var blueY: Int
    var count: Int
}

let dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
let xRange = (0..<n), yRange = (0..<m)

var start: Item = .init(redX: -1, redY: -1, blueX: -1, blueY: -1, count: 0)
var map: [[String]] = []
for i in 0..<n {
    let input = Array(readLine()!).map { String($0) }
    map.append(input)
    
    if start.redX == -1 || start.blueX == -1 {
        for j in 0..<input.count {
            if input[j] == "R" {
                start.redX = i
                start.redY = j
            } else if input[j] == "B" {
                start.blueX = i
                start.blueY = j
            }
        }
    }
}

var queue: [Item] = [start]
var index = 0
var visited: [[[[Bool]]]] = Array(repeating: Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: m), count: n)
visited[start.redX][start.redY][start.blueX][start.blueY] = true

var result = -1
while index < queue.count {
    let node = queue[index]
    index += 1
    
    if node.count > 10 {
        break
    }
    
    if map[node.redX][node.redY] == "O" && map[node.blueX][node.blueY] != "O" {
        result = node.count
        break
    }
    
    for i in 0..<4 {
        var nextRedX = node.redX
        var nextRedY = node.redY
        var nextBlueX = node.blueX
        var nextBlueY = node.blueY
        
        //빨간 구슬 기울기
        while xRange ~= nextRedX, yRange ~= nextRedY {
            if map[nextRedX][nextRedY] != "#" && map[nextRedX][nextRedY] != "O" {
                nextRedX += dx[i]
                nextRedY += dy[i]
            } else if map[nextRedX][nextRedY] == "#" {
                nextRedX -= dx[i]
                nextRedY -= dy[i]
                break
            } else {
                break
            }
        }
        
        //파란 구슬 기울기
        while xRange ~= nextBlueX, yRange ~= nextBlueY {
            if map[nextBlueX][nextBlueY] != "#" && map[nextBlueX][nextBlueY] != "O" {
                nextBlueX += dx[i]
                nextBlueY += dy[i]
            } else if map[nextBlueX][nextBlueY] == "#" {
                nextBlueX -= dx[i]
                nextBlueY -= dy[i]
                break
            } else {
                break
            }
        }
        
        //겹치는 경우
        if nextRedX == nextBlueX && nextRedY == nextBlueY {
            if map[nextRedX][nextRedY] != "O" {
                //더 많이 움직인 구슬을 반대 방향으로 한 칸 이동
                let redDist = abs(nextRedX - node.redX) + abs(nextRedY - node.redY)
                let blueDist = abs(nextBlueX - node.blueX) + abs(nextBlueY - node.blueY)
                
                if redDist > blueDist {
                    nextRedX -= dx[i]
                    nextRedY -= dy[i]
                } else {
                    nextBlueX -= dx[i]
                    nextBlueY -= dy[i]
                }
            }
        }
        
        if !visited[nextRedX][nextRedY][nextBlueX][nextBlueY] {
            visited[nextRedX][nextRedY][nextBlueX][nextBlueY] = true
            let next = Item(redX: nextRedX, redY: nextRedY, blueX: nextBlueX, blueY: nextBlueY, count: node.count + 1)
            queue.append(next)
        }
    }
}

print(result)
