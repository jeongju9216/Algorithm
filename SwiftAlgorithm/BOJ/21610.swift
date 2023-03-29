//
//  21610.swift
//  SwiftAlgorithm
//
//  Created by 유정주 on 2023/03/28.
//

import Foundation

typealias Point = (x: Int, y: Int)

//0, ←, ↖, ↑, ↗, →, ↘, ↓, ↙
let dx = [0, 0, -1, -1, -1, 0, 1, 1, 1]
let dy = [0, -1, -1, 0, 1, 1, 1, 0, -1]

func moveCloud(_ direction: Int, _ moving: Int) {
    let moving = moving % n
    for i in 0..<clouds.count {
        clouds[i].x = (clouds[i].x + moving * dx[direction] + n) % n
        clouds[i].y = (clouds[i].y + moving * dy[direction] + n) % n
        
        map[clouds[i].x][clouds[i].y] += 1
    }
}

func copyWater() {
    for cloud in clouds {
        var copyCount = 0
        
        for direction in stride(from: 2, through: 8, by: +2) {
            let nx = cloud.x + dx[direction]
            let ny = cloud.y + dy[direction]
            
            guard (0..<n) ~= nx, (0..<n) ~= ny else {
                continue
            }
            
            if map[nx][ny] > 0 {
                copyCount += 1
            }
        }
        
        map[cloud.x][cloud.y] += copyCount
    }
}

func createClouds() {
    var newClouds: [Point] = []
    for i in 0..<n {
        for j in 0..<n {
            if map[i][j] >= 2 && !clouds.contains(where: { $0 == (i, j) }) {
                newClouds.append((i, j))
                map[i][j] -= 2
            }
        }
    }
    
    clouds = newClouds
}

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var map: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    map.append(input)
}

var commands: [[Int]] = []
for _ in 0..<m {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    commands.append(input)
}

var clouds: [Point] = [(n-1, 0), (n-2, 0), (n-1, 1), (n-2, 1)]
for command in commands {
    moveCloud(command[0], command[1])
    copyWater()
    createClouds()
}

let result = map.flatMap { $0 }.reduce(0, +)
print(result)
